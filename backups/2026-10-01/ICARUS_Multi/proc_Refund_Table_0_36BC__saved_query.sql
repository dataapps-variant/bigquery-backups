-- =====================================================
-- REFUND TABLE — BIT-EXACT OPTIMIZATION OF THE ORIGINAL
--
-- Compared to your true original query, this preserves:
--   • FX = AVG(Value_USD) over all dates ≤ BC_start_date (identical)
--   • max_billing_cycles = 36 (identical)
--   • All CASE branches for offsets, BC_start_date, denominator_bc (identical)
--   • Plan_List: winner row by MIN(Trial_Price), Trial_Price = AVG (identical)
--   • Country_Code JP / Non-JP / blank branches (identical)
--   • Currency filter on base joins (identical)
--   • cohort_selection_bc = IF(Trial_Type='NT', 1, 0) (identical)
--   • Cohort: top-v_cohort_size by Date_of_Sale DESC (identical)
--   • Refund window, NT-BC0 zeroing (identical)
--   • Data-quality filter on refund ratio (identical)
--   • Final aggregation with 'Multi' currency label (identical)
--   • Final output schema (identical column names and order)
--
-- Performance changes (no logic changes):
--   1. Fact table scanned ONCE (not twice for cohort + refunds)
--   2. Cohort selection uses pre-rank + r_start instead of 15B-row QUALIFY-sort
--   3. Column pruning on fact scan
--   4. Partition + cluster on output table
--   5. Redundant CTE chains collapsed (no math changes)
--
-- Non-deterministic tie-breaking is inherent to both original and this version:
--   • Plan_List rows tied on Trial_Price
--   • Cohort facts tied on Date_of_Sale at rank v_cohort_size
--   Neither the original nor this version specifies deterministic tie-breakers.
-- =====================================================

CREATE OR REPLACE PROCEDURE `variant-finance-data-project.ICARUS_Multi.proc_Refund_Table_0_36BC`()
BEGIN

  ------------------------------------------------------------------
  -- CONFIG — all values identical to your original CTE
  ------------------------------------------------------------------
  DECLARE v_report_start_date       DATE     DEFAULT DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY);
  DECLARE v_report_end_date         DATE     DEFAULT DATE('2025-01-01');
  DECLARE v_cohort_size             INT64    DEFAULT 7000;
  DECLARE v_minimum_user_count      INT64    DEFAULT 100;
  DECLARE v_retry_engine_period     INT64    DEFAULT 30;
  DECLARE v_max_billing_cycles      INT64    DEFAULT 36;      -- 36, per your original
  DECLARE v_default_regular_bc      INT64    DEFAULT 30;
  DECLARE v_refund_ratio_threshold  FLOAT64  DEFAULT 0.20;
  DECLARE v_minimum_refund_count    INT64    DEFAULT 30;

  ------------------------------------------------------------------
  -- TEMP 1 — Plan_List aggregation
  -- Logic: for each (Product, Country, Currency),
  --   • attributes come from the row with MIN(Trial_Price)
  --   • Trial_Price value is AVG(Trial_Price) across the group
  -- This mirrors your original plan_list_ranked → plan_list_first_record
  -- + plan_list_trial_price_avg → aggregated_plan_list.
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
    AVG(Trial_Price)          AS Trial_Price,
    MIN(First_Date_of_Sale)   AS First_Date_of_Sale
  FROM (
    SELECT
      Product_Name_Final, Country_Code, Currency,
      -- Winner-row attributes (equivalent to ROW_NUMBER()=1)
      FIRST_VALUE(Entity_Name)   OVER w AS Entity_Name,
      FIRST_VALUE(App_Name)      OVER w AS App_Name,
      FIRST_VALUE(Trial_Type)    OVER w AS Trial_Type,
      FIRST_VALUE(Trial_Period)  OVER w AS Trial_Period,
      FIRST_VALUE(Regular_Price) OVER w AS Regular_Price,
      Trial_Price,
      First_Date_of_Sale
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
  -- TEMP 2 — Business logic (dates × products × BCs with offsets)
  -- All CASE expressions preserve your original arithmetic exactly.
  -- Nested DATE_SUB(DATE_SUB(...)) is folded into single INTERVAL for
  -- clarity — verified equivalent (a - X - Y - 1 == a - (X+Y+1)).
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
        COALESCE(dm.`Delay days`, v_default_regular_bc) AS regular_bc_period
      FROM tmp_agg_plan_list apl
      JOIN report_dates rd
        ON rd.report_date >= apl.First_Date_of_Sale       -- prune, doesn't change output
      CROSS JOIN billing_cycle_range bcr
      LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Plan_SOTDays_Map` dm
        ON dm.`Plan Name` = apl.Product_Name_Final
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

    -- Denominator_BC (identical to original)
    CASE
      WHEN billing_cycle = 0 THEN 0
      WHEN billing_cycle = 1 AND Trial_Type = 'NT' THEN 1
      WHEN billing_cycle = 1 AND Trial_Type != 'NT' THEN 0
      ELSE billing_cycle - 1
    END AS calculated_denominator_bc,

    -- BC_start_date (identical arithmetic; nested DATE_SUB folded)
    CASE
      WHEN Trial_Type != 'NT' AND billing_cycle = 0 THEN
        DATE_SUB(report_date, INTERVAL Trial_Period + 1 DAY)
      WHEN Trial_Type != 'NT' AND billing_cycle >= 1 THEN
        DATE_SUB(report_date, INTERVAL Trial_Period + billing_cycle * regular_bc_period + 1 DAY)
      WHEN Trial_Type = 'NT' AND billing_cycle = 0 THEN report_date
      WHEN Trial_Type = 'NT' AND billing_cycle >= 1 THEN
        DATE_SUB(report_date, INTERVAL billing_cycle * regular_bc_period + 1 DAY)
    END AS calculated_bc_start_date,

    -- start_offset_days (identical to original)
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

    -- end_offset_days (identical to original)
    CASE
      WHEN Trial_Type != 'NT' AND billing_cycle = 0 THEN Trial_Period - 1
      WHEN Trial_Type != 'NT' AND billing_cycle >= 1 THEN
        Trial_Period + (billing_cycle * regular_bc_period) - 1
      WHEN Trial_Type = 'NT' AND billing_cycle = 0 THEN 0
      WHEN Trial_Type = 'NT' AND billing_cycle >= 1 THEN
        (billing_cycle * regular_bc_period) - 1
    END AS calculated_end_offset_days,

    -- Cohort selection BC (identical to original)
    CASE WHEN Trial_Type = 'NT' THEN 1 ELSE 0 END AS cohort_selection_bc
  FROM enriched;

  ------------------------------------------------------------------
  -- TEMP 3 — Base fact scan (ONCE, column-pruned, country pre-bucketed)
  -- Filter keeps only rows that could feed either cohort selection OR
  -- refund calculation. This does NOT drop any row the original would
  -- have used, because:
  --   • cohort selection uses Billing_Cycle_Updated IN (0,1) only
  --   • refund calc requires Refund_Amount_USD > 0 AND Refund_Date NOT NULL
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
  -- TEMP 4 — Exchange rates
  -- LOGIC PRESERVED: AVG(Value_USD) over all rows where Date ≤ BC_start_date,
  -- exactly as in your original. USD stays 1.0, missing rates fall back to 1.0.
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
  -- TEMP 5a — Pre-rank base_facts ONCE
  -- Rationale: your original ranks facts inside the QUALIFY window
  -- FOR EACH (report_date × BC × combo) — repeating the same sort
  -- ~21,800 times per combo. Since cohort_selection_bc depends only
  -- on Trial_Type (fixed per Product/Country/Currency), the eligible
  -- fact pool is IDENTICAL across all report_dates and BCs for a
  -- combo. So we rank once. Two rank columns cover both country cases.
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
  -- TEMP 5b — Cohort bounds
  -- For each business_logic row, r_start = MIN(rank) where
  -- Date_of_Sale ≤ cutoff. Because rank is ORDER BY Date_of_Sale DESC,
  -- the row with the smallest rank whose Date_of_Sale ≤ cutoff is
  -- exactly the "top-1 by Date_of_Sale DESC among eligible rows" — i.e.
  -- rank 1 in your original QUALIFY. Ranks r_start .. r_start+N-1 are
  -- exactly the top N eligible rows.
  ------------------------------------------------------------------
  CREATE TEMP TABLE tmp_cohort_bounds AS

  -- Branch C: JP / Non-JP — country equality (mirrors original UNION branch 1)
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

  -- Branch A: NULL / blank Country_Code — no country filter (mirrors original UNION branch 2)
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
  -- TEMP 5c — Selected cohort
  -- Integer range join expands r_start into ≤ v_cohort_size rows.
  -- Equivalent to your original QUALIFY ROW_NUMBER() ≤ v_cohort_size.
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
  -- FINAL CTAS — matches original schema exactly.
  -- Original CTE chain (business_logic → cohort_analysis → bc_end_date
  -- → all_customer_refunds → filtered_refunds → refund_metrics →
  -- core_metrics → final_calculations → aggregated_output → final SELECT)
  -- is collapsed into fewer CTEs. Arithmetic identical.
  ------------------------------------------------------------------
  CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.Refund_Table_0_36BC`
  PARTITION BY Report_date
  CLUSTER BY Product_Name_Final, Country_Code, Billing_Cycle
  AS
  WITH
    cohort_summary AS (
      SELECT
        report_date, Product_Name_Final, Country_Code, Currency, billing_cycle,
        COUNT(*)          AS actual_cohort_count,
        MIN(Date_of_Sale) AS calculated_bc_end_date
      FROM tmp_selected_cohort
      GROUP BY report_date, Product_Name_Final, Country_Code, Currency, billing_cycle
    ),

    -- Refund calculation: identical filter/window logic and NT-BC0 zero rule
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

    -- Per-currency assembly (replaces original core_metrics + final_calculations)
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
    LEAST(COALESCE(cs.actual_cohort_count, 0), v_cohort_size) AS final_cohort_final_users,
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

    -- Refund_Users per currency (identical formula to original)
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

    -- Aggregate across currencies to (report_date, product, country, BC) grain
    -- 'Multi' label logic identical to original
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

  -- Final SELECT — column names/order match original exactly
  SELECT
    ao.report_date                                                   AS Report_date,
    ao.Product_Name_Final,
    ao.billing_cycle                                                 AS Billing_Cycle,
    v_cohort_size                                                    AS Cohort_Size,
    v_minimum_user_count                                             AS Minimum_User_count,
    v_retry_engine_period                                            AS Retry_engine_Period,
    ao.Entity_Name,
    -- App_Name: same formatting logic as original
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
    -- Refund_Ratio with data-quality filter — identical to original
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

END;
