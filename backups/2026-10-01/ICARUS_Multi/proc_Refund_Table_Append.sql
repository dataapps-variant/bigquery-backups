CREATE PROCEDURE `variant-finance-data-project`.ICARUS_Multi.proc_Refund_Table_Append()
BEGIN

  ------------------------------------------------------------------
  -- APPEND CONTROL
  ------------------------------------------------------------------
  DECLARE lookback_days        INT64 DEFAULT 7;      -- days restated each run
  DECLARE fallback_date        DATE  DEFAULT DATE('2024-12-31');  -- day BEFORE first date wanted
  DECLARE last_processed_date  DATE;
  DECLARE new_start_date       DATE;
  DECLARE new_end_date         DATE;
  DECLARE days_to_process      INT64;

  ------------------------------------------------------------------
  -- CONFIG — identical values to the rebuild.
  -- The two date vars are declared WITHOUT defaults and SET below.
  ------------------------------------------------------------------
  DECLARE v_report_start_date       DATE;            -- LATER bound  (was CURRENT_DATE()-1)
  DECLARE v_report_end_date         DATE;            -- EARLIER bound (was DATE('2025-01-01'))
  DECLARE v_cohort_size             INT64    DEFAULT 7000;
  DECLARE v_minimum_user_count      INT64    DEFAULT 100;
  DECLARE v_retry_engine_period     INT64    DEFAULT 30;
  DECLARE v_max_billing_cycles      INT64    DEFAULT 24;
  DECLARE v_default_regular_bc      INT64    DEFAULT 30;
  DECLARE v_refund_ratio_threshold  FLOAT64  DEFAULT 0.20;
  DECLARE v_minimum_refund_count    INT64    DEFAULT 30;

  ------------------------------------------------------------------
  -- STEP 1 — DELETE THE RESTATEMENT WINDOW
  -- Refund rows keep arriving after a report_date is first written, so the
  -- last N days are always recomputed rather than trusted. See the
  -- LOOKBACK note at the bottom — 7 days may not be enough here.
  ------------------------------------------------------------------
  DELETE FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`
  WHERE Report_date >= DATE_SUB(
    (SELECT MAX(Report_date) FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`),
    INTERVAL lookback_days DAY
  );

  ------------------------------------------------------------------
  -- STEP 2 — WORK OUT THE WINDOW TO BUILD
  ------------------------------------------------------------------
  SET last_processed_date = (
    SELECT COALESCE(MAX(Report_date), fallback_date)
    FROM `variant-finance-data-project.ICARUS_Multi.Refund_Table`
  );

  SET new_start_date  = DATE_ADD(last_processed_date, INTERVAL 1 DAY);
  SET new_end_date    = DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY);
  SET days_to_process = DATE_DIFF(new_end_date, new_start_date, DAY) + 1;

  -- Feed the window into the original config vars.
  -- NOTE THE CROSSOVER: in GENERATE_DATE_ARRAY(v_report_end_date,
  -- v_report_start_date) the FIRST argument is the earlier bound. Mapping
  -- new_start_date to v_report_start_date would build a descending array
  -- and silently produce zero rows.
  SET v_report_end_date   = new_start_date;   -- earlier
  SET v_report_start_date = new_end_date;     -- later

  IF days_to_process > 0 THEN

    SELECT
      last_processed_date AS Last_Processed,
      new_start_date      AS Processing_From,
      new_end_date        AS Processing_To,
      days_to_process     AS Days_To_Process,
      'Processing...'     AS Status;

    ------------------------------------------------------------------
    -- TEMP 1 — Plan_List aggregation  (unchanged)
    ------------------------------------------------------------------
    CREATE TEMP TABLE tmp_agg_plan_list
    CLUSTER BY Product_Name_Final, Country_Code, Currency
    AS
    SELECT
      Product_Name_Final,
      Country_Code,
      Currency,
      ANY_VALUE(Entity_Name)    AS Entity_Name,
      ANY_VALUE(App_Name)       AS App_Name,
      ANY_VALUE(Trial_Type)     AS Trial_Type,
      ANY_VALUE(Trial_Period)   AS Trial_Period,
      ANY_VALUE(Regular_Price)  AS Regular_Price,
      AVG(Trial_Price)          AS Trial_Price
    FROM (
      SELECT
        Product_Name_Final, Country_Code, Currency,
        FIRST_VALUE(Entity_Name)   OVER w AS Entity_Name,
        FIRST_VALUE(App_Name)      OVER w AS App_Name,
        FIRST_VALUE(Trial_Type)    OVER w AS Trial_Type,
        FIRST_VALUE(Trial_Period)  OVER w AS Trial_Period,
        FIRST_VALUE(Regular_Price) OVER w AS Regular_Price,
        Trial_Price
      FROM `variant-finance-data-project.ICARUS_Multi.Plan_List`
      WHERE Product_Name_Final IS NOT NULL
      WINDOW w AS (
        PARTITION BY Product_Name_Final, Country_Code, Currency
        ORDER BY Trial_Price
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
      )
    )
    GROUP BY Product_Name_Final, Country_Code, Currency;

    ------------------------------------------------------------------
    -- TEMP 2 — Business logic
    -- ONLY CHANGE: GENERATE_DATE_ARRAY now spans the append window
    -- instead of 2025-01-01 → yesterday. This is what makes the run
    -- incremental — every CTE below inherits the narrower date set.
    ------------------------------------------------------------------
    CREATE TEMP TABLE tmp_business_logic
    PARTITION BY report_date
    CLUSTER BY Product_Name_Final, Country_Code, billing_cycle
    AS
    WITH
      report_dates AS (
        SELECT report_date
        FROM UNNEST(GENERATE_DATE_ARRAY(v_report_end_date, v_report_start_date, INTERVAL 1 DAY)) AS report_date
      ),
      billing_cycle_range AS (
        SELECT bc AS billing_cycle
        FROM UNNEST(GENERATE_ARRAY(0, v_max_billing_cycles)) AS bc
      ),
      delay_map AS (
        SELECT `Plan Name` AS Plan_Name, MIN(`Delay days`) AS Delay_days
        FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Plan_SOTDays_Map`
        GROUP BY 1
      ),
      enriched AS (
        SELECT
          rd.report_date,
          apl.Product_Name_Final,
          apl.Country_Code,
          apl.Currency,
          bcr.billing_cycle,
          apl.Entity_Name,
          apl.App_Name,
          apl.Trial_Type,
          apl.Trial_Period,
          apl.Trial_Price,
          apl.Regular_Price,
          COALESCE(dm.Delay_days, v_default_regular_bc) AS regular_bc_period
        FROM tmp_agg_plan_list apl
        CROSS JOIN report_dates rd
        CROSS JOIN billing_cycle_range bcr
        LEFT JOIN delay_map dm
          ON dm.Plan_Name = apl.Product_Name_Final
      )
    SELECT
      report_date,
      Product_Name_Final,
      Country_Code,
      Currency,
      billing_cycle,
      Entity_Name,
      App_Name,
      Trial_Type,
      Trial_Period,
      Trial_Price,
      Regular_Price,
      regular_bc_period AS calculated_regular_bc_period,

      CASE
        WHEN billing_cycle = 0 THEN 0
        WHEN billing_cycle = 1 AND Trial_Type = 'NT' THEN 1
        WHEN billing_cycle = 1 AND Trial_Type != 'NT' THEN 0
        ELSE billing_cycle - 1
      END AS calculated_denominator_bc,

      CASE
        WHEN Trial_Type != 'NT' AND billing_cycle = 0 THEN
          DATE_SUB(report_date, INTERVAL Trial_Period + 1 DAY)
        WHEN Trial_Type != 'NT' AND billing_cycle >= 1 THEN
          DATE_SUB(report_date, INTERVAL Trial_Period + billing_cycle * regular_bc_period + 1 DAY)
        WHEN Trial_Type = 'NT' AND billing_cycle = 0 THEN report_date
        WHEN Trial_Type = 'NT' AND billing_cycle >= 1 THEN
          DATE_SUB(report_date, INTERVAL billing_cycle * regular_bc_period + 1 DAY)
      END AS calculated_bc_start_date,

      CASE
        WHEN Trial_Type != 'NT' AND billing_cycle = 0 THEN 0
        WHEN Trial_Type != 'NT' AND billing_cycle = 1 THEN Trial_Period
        WHEN Trial_Type != 'NT' AND billing_cycle >= 2 THEN
          Trial_Period + ((billing_cycle - 1) * regular_bc_period)
        WHEN Trial_Type = 'NT' AND billing_cycle = 0 THEN 0
        WHEN Trial_Type = 'NT' AND billing_cycle = 1 THEN 0
        WHEN Trial_Type = 'NT' AND billing_cycle >= 2 THEN
          (billing_cycle - 1) * regular_bc_period
      END AS calculated_start_offset_days,

      CASE
        WHEN Trial_Type != 'NT' AND billing_cycle = 0 THEN Trial_Period - 1
        WHEN Trial_Type != 'NT' AND billing_cycle >= 1 THEN
          Trial_Period + (billing_cycle * regular_bc_period) - 1
        WHEN Trial_Type = 'NT' AND billing_cycle = 0 THEN 0
        WHEN Trial_Type = 'NT' AND billing_cycle >= 1 THEN
          (billing_cycle * regular_bc_period) - 1
      END AS calculated_end_offset_days,

      CASE WHEN Trial_Type = 'NT' THEN 1 ELSE 0 END AS cohort_selection_bc
    FROM enriched;

    ------------------------------------------------------------------
    -- TEMP 3 — Base fact scan  (unchanged, and deliberately NOT date-filtered)
    --
    -- Do not be tempted to add "AND Date_of_Sale >= new_start_date" here.
    -- The cohort for a report_date is the top v_cohort_size sales with
    -- Date_of_Sale <= bc_start_date, and at billing_cycle 24 that cutoff is
    -- ~720 days before report_date. Filtering this scan to the append window
    -- would empty the cohort for every high BC. This CTE must keep seeing
    -- full history even on a 1-day incremental run.
    ------------------------------------------------------------------
    CREATE TEMP TABLE tmp_base_facts
    CLUSTER BY Product_Name_Final, Currency, derived_country_code
    AS
    SELECT
      b.Updated_Cust_ID,
      b.Product_Name_Final_Merged AS Product_Name_Final,
      b.Currency,
      b.Billing_Cycle_Updated,
      b.Date_of_Sale,
      b.Refund_Date,
      b.Refund_Amount_USD,
      b.Order_Id,
      CASE
        WHEN b.Spend_Country_Code_AFID = 'JP' THEN 'JP'
        ELSE 'Non-JP'
      END AS derived_country_code
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` b
    WHERE b.Product_Name_Final_Merged IS NOT NULL
      AND (
        b.Billing_Cycle_Updated IN (0, 1)
        OR (b.Refund_Amount_USD > 0 AND b.Refund_Date IS NOT NULL)
      );

    ------------------------------------------------------------------
    -- TEMP 4 — Exchange rates  (unchanged)
    -- Naturally shrinks on an incremental run: distinct_lookups is driven
    -- off tmp_business_logic, which now holds only the append window.
    ------------------------------------------------------------------
    CREATE TEMP TABLE tmp_exchange_rates
    CLUSTER BY Currency, calculated_bc_start_date
    AS
    WITH distinct_lookups AS (
      SELECT DISTINCT Currency, calculated_bc_start_date
      FROM tmp_business_logic
      WHERE Currency != 'USD'
    )
    SELECT
      dl.Currency,
      dl.calculated_bc_start_date,
      COALESCE(AVG(er.Value_USD), 1.0) AS final_exchange_rate
    FROM distinct_lookups dl
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate` er
      ON  er.Currency = dl.Currency
      AND er.Date    <= dl.calculated_bc_start_date
    GROUP BY dl.Currency, dl.calculated_bc_start_date;

    ------------------------------------------------------------------
    -- TEMP 5a — Pre-rank base facts  (unchanged, full history by design)
    ------------------------------------------------------------------
    CREATE TEMP TABLE tmp_ranked_base
    CLUSTER BY Product_Name_Final, Currency, Billing_Cycle_Updated, derived_country_code
    AS
    SELECT
      Product_Name_Final,
      Currency,
      Billing_Cycle_Updated,
      derived_country_code,
      Updated_Cust_ID,
      Date_of_Sale,
      ROW_NUMBER() OVER (
        PARTITION BY Product_Name_Final, Currency, Billing_Cycle_Updated, derived_country_code
        ORDER BY Date_of_Sale DESC
      ) AS r_country,
      ROW_NUMBER() OVER (
        PARTITION BY Product_Name_Final, Currency, Billing_Cycle_Updated
        ORDER BY Date_of_Sale DESC
      ) AS r_all
    FROM tmp_base_facts
    WHERE Billing_Cycle_Updated IN (0, 1);

    ------------------------------------------------------------------
    -- TEMP 5b — Cohort bounds  (unchanged)
    ------------------------------------------------------------------
    CREATE TEMP TABLE tmp_cohort_bounds AS

    SELECT
      bl.report_date,
      bl.Product_Name_Final,
      bl.Country_Code,
      bl.Currency,
      bl.billing_cycle,
      bl.cohort_selection_bc,
      'C' AS branch,
      MIN(rb.r_country) AS r_start
    FROM tmp_business_logic bl
    JOIN tmp_ranked_base rb
      ON  rb.Product_Name_Final    = bl.Product_Name_Final
      AND rb.Currency              = bl.Currency
      AND rb.Billing_Cycle_Updated = bl.cohort_selection_bc
      AND rb.derived_country_code  = bl.Country_Code
    WHERE bl.Country_Code IN ('JP', 'Non-JP')
      AND rb.Date_of_Sale <= bl.calculated_bc_start_date
    GROUP BY 1,2,3,4,5,6

    UNION ALL

    SELECT
      bl.report_date,
      bl.Product_Name_Final,
      bl.Country_Code,
      bl.Currency,
      bl.billing_cycle,
      bl.cohort_selection_bc,
      'A' AS branch,
      MIN(rb.r_all) AS r_start
    FROM tmp_business_logic bl
    JOIN tmp_ranked_base rb
      ON  rb.Product_Name_Final    = bl.Product_Name_Final
      AND rb.Currency              = bl.Currency
      AND rb.Billing_Cycle_Updated = bl.cohort_selection_bc
    WHERE (bl.Country_Code IS NULL OR TRIM(bl.Country_Code) = '')
      AND rb.Date_of_Sale <= bl.calculated_bc_start_date
    GROUP BY 1,2,3,4,5,6;

    ------------------------------------------------------------------
    -- TEMP 5c — Selected cohort  (unchanged)
    ------------------------------------------------------------------
    CREATE TEMP TABLE tmp_selected_cohort
    PARTITION BY report_date
    CLUSTER BY Product_Name_Final, Country_Code, Currency, Updated_Cust_ID
    AS

    SELECT
      cb.report_date,
      cb.Product_Name_Final,
      cb.Country_Code,
      cb.Currency,
      cb.billing_cycle,
      rb.Updated_Cust_ID,
      rb.Date_of_Sale
    FROM tmp_cohort_bounds cb
    JOIN tmp_ranked_base rb
      ON  rb.Product_Name_Final    = cb.Product_Name_Final
      AND rb.Currency              = cb.Currency
      AND rb.Billing_Cycle_Updated = cb.cohort_selection_bc
      AND rb.derived_country_code  = cb.Country_Code
      AND rb.r_country BETWEEN cb.r_start AND cb.r_start + v_cohort_size - 1
    WHERE cb.branch = 'C'

    UNION ALL

    SELECT
      cb.report_date,
      cb.Product_Name_Final,
      cb.Country_Code,
      cb.Currency,
      cb.billing_cycle,
      rb.Updated_Cust_ID,
      rb.Date_of_Sale
    FROM tmp_cohort_bounds cb
    JOIN tmp_ranked_base rb
      ON  rb.Product_Name_Final    = cb.Product_Name_Final
      AND rb.Currency              = cb.Currency
      AND rb.Billing_Cycle_Updated = cb.cohort_selection_bc
      AND rb.r_all BETWEEN cb.r_start AND cb.r_start + v_cohort_size - 1
    WHERE cb.branch = 'A';

    ------------------------------------------------------------------
    -- INSERT — was CREATE OR REPLACE TABLE ..._staging in the rebuild.
    -- Everything from the WITH down is identical to the rebuild's final CTAS.
    -- The explicit column list guards against a future schema reorder.
    ------------------------------------------------------------------
    INSERT INTO `variant-finance-data-project.ICARUS_Multi.Refund_Table` (
      Report_date, Product_Name_Final, Billing_Cycle, Cohort_Size,
      Minimum_User_count, Retry_engine_Period, Entity_Name, App_Name,
      Trial_Type, Trial_Period, Currency, Trial_Price, Regular_Price,
      Country_Code, Regular_BC_period, Exchange_rate, Denominator_BC,
      BC_start_date, BC_end_date, start_offset_days, end_offset_days,
      Cohort_final_users, Refund_Amount, Refund_Users, Refund_Ratio
    )
    WITH
      cohort_summary AS (
        SELECT
          report_date, Product_Name_Final, Country_Code, Currency, billing_cycle,
          COUNT(*)          AS actual_cohort_count,
          MIN(Date_of_Sale) AS calculated_bc_end_date
        FROM tmp_selected_cohort
        GROUP BY report_date, Product_Name_Final, Country_Code, Currency, billing_cycle
      ),

      refund_metrics AS (
        SELECT
          sc.report_date,
          sc.Product_Name_Final,
          sc.Country_Code,
          sc.Currency,
          sc.billing_cycle,
          bl.Trial_Type,
          CASE WHEN bl.Trial_Type = 'NT' AND sc.billing_cycle = 0 THEN 0
               ELSE COUNT(DISTINCT bf.Order_Id) END       AS clean_refund_count,
          CASE WHEN bl.Trial_Type = 'NT' AND sc.billing_cycle = 0 THEN 0.0
               ELSE SUM(bf.Refund_Amount_USD) END         AS clean_refund_amount
        FROM tmp_selected_cohort sc
        JOIN tmp_business_logic bl
          ON  bl.report_date        = sc.report_date
          AND bl.Product_Name_Final = sc.Product_Name_Final
          AND bl.Country_Code       = sc.Country_Code
          AND bl.Currency           = sc.Currency
          AND bl.billing_cycle      = sc.billing_cycle
        JOIN tmp_base_facts bf
          ON  bf.Updated_Cust_ID    = sc.Updated_Cust_ID
          AND bf.Product_Name_Final = sc.Product_Name_Final
          AND bf.Currency           = sc.Currency
          AND (
            sc.Country_Code IS NULL OR TRIM(sc.Country_Code) = ''
            OR bf.derived_country_code = sc.Country_Code
          )
        WHERE bf.Refund_Amount_USD > 0
          AND bf.Refund_Date IS NOT NULL
          AND bf.Refund_Date BETWEEN DATE_ADD(sc.Date_of_Sale, INTERVAL bl.calculated_start_offset_days DAY)
                                 AND DATE_ADD(sc.Date_of_Sale, INTERVAL bl.calculated_end_offset_days DAY)
        GROUP BY sc.report_date, sc.Product_Name_Final, sc.Country_Code, sc.Currency,
                 sc.billing_cycle, bl.Trial_Type
      ),

      per_currency AS (
        SELECT
          bl.report_date,
          bl.Product_Name_Final,
          bl.Country_Code,
          bl.Currency,
          bl.billing_cycle,
          bl.Entity_Name,
          bl.App_Name,
          bl.Trial_Type,
          bl.Trial_Period,
          bl.Trial_Price,
          bl.Regular_Price,
          bl.calculated_regular_bc_period,
          bl.calculated_denominator_bc,
          bl.calculated_bc_start_date,
          bl.calculated_start_offset_days,
          bl.calculated_end_offset_days,
          IF(bl.Currency = 'USD', 1.0, COALESCE(er.final_exchange_rate, 1.0)) AS final_exchange_rate,
          cs.calculated_bc_end_date,
          CASE WHEN cs.actual_cohort_count = v_cohort_size THEN v_cohort_size
               ELSE cs.actual_cohort_count END AS final_cohort_final_users,
          COALESCE(rm.clean_refund_count, 0)    AS clean_refund_count,
          COALESCE(rm.clean_refund_amount, 0.0) AS clean_refund_amount
        FROM tmp_business_logic bl
        LEFT JOIN tmp_exchange_rates er
          ON  er.Currency                 = bl.Currency
          AND er.calculated_bc_start_date = bl.calculated_bc_start_date
        LEFT JOIN cohort_summary cs
          ON  cs.report_date        = bl.report_date
          AND cs.Product_Name_Final = bl.Product_Name_Final
          AND cs.Country_Code       = bl.Country_Code
          AND cs.Currency           = bl.Currency
          AND cs.billing_cycle      = bl.billing_cycle
        LEFT JOIN refund_metrics rm
          ON  rm.report_date        = bl.report_date
          AND rm.Product_Name_Final = bl.Product_Name_Final
          AND rm.Country_Code       = bl.Country_Code
          AND rm.Currency           = bl.Currency
          AND rm.billing_cycle      = bl.billing_cycle
      ),

      per_currency_with_users AS (
        SELECT pc.*,
          COALESCE(
            SAFE_DIVIDE(
              pc.clean_refund_amount,
              NULLIF(IF(pc.billing_cycle = 0, pc.Trial_Price, pc.Regular_Price) * pc.final_exchange_rate, 0)
            ), 0.0
          ) AS Refund_Users
        FROM per_currency pc
      ),

      aggregated_output AS (
        SELECT
          report_date,
          Product_Name_Final,
          Country_Code,
          billing_cycle,
          IF(COUNT(DISTINCT Currency) > 1, 'Multi', MIN(Currency)) AS Currency,
          MAX(Entity_Name)                  AS Entity_Name,
          MAX(App_Name)                     AS App_Name,
          MAX(Trial_Type)                   AS Trial_Type,
          MAX(Trial_Period)                 AS Trial_Period,
          MAX(Trial_Price)                  AS Trial_Price,
          MAX(Regular_Price)                AS Regular_Price,
          MAX(calculated_regular_bc_period) AS calculated_regular_bc_period,
          MAX(final_exchange_rate)          AS final_exchange_rate,
          MAX(calculated_denominator_bc)    AS calculated_denominator_bc,
          MAX(calculated_bc_start_date)     AS calculated_bc_start_date,
          MAX(calculated_bc_end_date)       AS calculated_bc_end_date,
          MAX(calculated_start_offset_days) AS calculated_start_offset_days,
          MAX(calculated_end_offset_days)   AS calculated_end_offset_days,
          SUM(final_cohort_final_users)     AS final_cohort_final_users,
          SUM(clean_refund_count)           AS clean_refund_count,
          SUM(clean_refund_amount)          AS clean_refund_amount,
          SUM(Refund_Users)                 AS Refund_Users
        FROM per_currency_with_users
        GROUP BY report_date, Product_Name_Final, Country_Code, billing_cycle
      )

    SELECT
      ao.report_date                                                   AS Report_date,
      ao.Product_Name_Final,
      ao.billing_cycle                                                 AS Billing_Cycle,
      v_cohort_size                                                    AS Cohort_Size,
      v_minimum_user_count                                             AS Minimum_User_count,
      v_retry_engine_period                                            AS Retry_engine_Period,
      ao.Entity_Name,
      CASE
        WHEN ao.Country_Code IS NULL OR ao.Country_Code = '' THEN ao.App_Name
        ELSE CONCAT(ao.App_Name, '-', ao.Country_Code)
      END                                                              AS App_Name,
      ao.Trial_Type,
      ao.Trial_Period,
      ao.Currency,
      ao.Trial_Price,
      ao.Regular_Price,
      ao.Country_Code,
      ao.calculated_regular_bc_period                                  AS Regular_BC_period,
      ao.final_exchange_rate                                           AS Exchange_rate,
      ao.calculated_denominator_bc                                     AS Denominator_BC,
      ao.calculated_bc_start_date                                      AS BC_start_date,
      ao.calculated_bc_end_date                                        AS BC_end_date,
      ao.calculated_start_offset_days                                  AS start_offset_days,
      ao.calculated_end_offset_days                                    AS end_offset_days,
      ao.final_cohort_final_users                                      AS Cohort_final_users,
      ao.clean_refund_amount                                           AS Refund_Amount,
      ao.Refund_Users,
      CASE
        WHEN ao.billing_cycle = 0 AND ao.Trial_Type = 'NT' THEN 0.0
        WHEN COALESCE(SAFE_DIVIDE(ao.Refund_Users, NULLIF(ao.final_cohort_final_users, 0)), 0.0) > v_refund_ratio_threshold
             AND ao.clean_refund_count < v_minimum_refund_count
          THEN 0.0
        ELSE COALESCE(SAFE_DIVIDE(ao.Refund_Users, NULLIF(ao.final_cohort_final_users, 0)), 0.0)
      END                                                              AS Refund_Ratio
    FROM aggregated_output ao;

    ------------------------------------------------------------------
    -- CLEANUP
    ------------------------------------------------------------------
    DROP TABLE IF EXISTS tmp_agg_plan_list;
    DROP TABLE IF EXISTS tmp_business_logic;
    DROP TABLE IF EXISTS tmp_base_facts;
    DROP TABLE IF EXISTS tmp_exchange_rates;
    DROP TABLE IF EXISTS tmp_ranked_base;
    DROP TABLE IF EXISTS tmp_cohort_bounds;
    DROP TABLE IF EXISTS tmp_selected_cohort;

    SELECT 'SUCCESS' AS Status;

  ELSE
    SELECT
      last_processed_date AS Last_Processed,
      new_end_date        AS Target_Date,
      'UP TO DATE'        AS Status;
  END IF;

END;
