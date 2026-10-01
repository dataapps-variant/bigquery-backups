CREATE PROCEDURE `variant-finance-data-project`.Icarus_Cohort.proc_IC_Refund_Table_AFID_24BC()
BEGIN

  ------------------------------------------------------------------
  -- CONFIG — values identical to your original config CTE
  ------------------------------------------------------------------
  DECLARE v_report_start_date       DATE     DEFAULT DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY);
  DECLARE v_report_end_date         DATE     DEFAULT DATE('2025-01-01');
  DECLARE v_cohort_size             INT64    DEFAULT 7000;
  DECLARE v_minimum_user_count      INT64    DEFAULT 100;
  DECLARE v_retry_engine_period     INT64    DEFAULT 30;
  DECLARE v_max_billing_cycles      INT64    DEFAULT 24;
  DECLARE v_default_regular_bc      INT64    DEFAULT 30;
  DECLARE v_refund_ratio_threshold  FLOAT64  DEFAULT 0.00;
  DECLARE v_minimum_refund_count    INT64    DEFAULT 30;

  ------------------------------------------------------------------
  -- TEMP 1 — Plan aggregation
  -- Your plan_list_ranked / first_record / trial_price_avg / aggregated
  -- chain in one pass. Grain: Product x Country_Code x AFID_Suffix.
  -- Note Currency is an ATTRIBUTE here (taken from the winner row), not
  -- part of the grain — matching your original.
  ------------------------------------------------------------------
  CREATE TEMP TABLE tmp_agg_plan_list
  CLUSTER BY Product_Name_Final, AFID_Suffix, Country_Code
  AS
  SELECT
    Product_Name_Final,
    Country_Code,
    AFID_Suffix,
    ANY_VALUE(Entity_Name)   AS Entity_Name,
    ANY_VALUE(App_Name)      AS App_Name,
    ANY_VALUE(Trial_Type)    AS Trial_Type,
    ANY_VALUE(Trial_Period)  AS Trial_Period,
    ANY_VALUE(Currency)      AS Currency,
    ANY_VALUE(Regular_Price) AS Regular_Price,
    AVG(Trial_Price)         AS Trial_Price
  FROM (
    SELECT
      Product_Name_Final, Country_Code, AFID_Suffix, Trial_Price,
      FIRST_VALUE(Entity_Name)   OVER w AS Entity_Name,
      FIRST_VALUE(App_Name)      OVER w AS App_Name,
      FIRST_VALUE(Trial_Type)    OVER w AS Trial_Type,
      FIRST_VALUE(Trial_Period)  OVER w AS Trial_Period,
      FIRST_VALUE(Currency)      OVER w AS Currency,
      FIRST_VALUE(Regular_Price) OVER w AS Regular_Price
    FROM `variant-finance-data-project.Icarus_Cohort.IC_Plan_List_AFID_24BC`
    WHERE Product_Name_Final IS NOT NULL
      AND AFID_Suffix IS NOT NULL
    WINDOW w AS (
      PARTITION BY Product_Name_Final,
                   COALESCE(Country_Code, 'NULL_GROUP'),
                   COALESCE(CAST(AFID_Suffix AS STRING), 'NULL_GROUP')
      ORDER BY Trial_Price ASC
      ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    )
  )
  GROUP BY Product_Name_Final, Country_Code, AFID_Suffix;

  ------------------------------------------------------------------
  -- TEMP 2 — Business logic
  -- Replaces report_dates + product_list + afid_list + billing_cycle_range
  -- + master_combinations + enriched_master + business_logic.
  --
  -- Your original CROSS JOINs product_list x afid_list (every AFID_Suffix
  -- against every product) and then INNER JOINs aggregated_plan_list to
  -- discard the invalid pairs. Since product_list is one row per product
  -- and afid_list one row per suffix, each surviving pair maps to exactly
  -- one aggregated_plan_list row — so driving off tmp_agg_plan_list gives
  -- the identical row set without materialising the invalid pairs.
  --
  -- Nested DATE_SUB folded into one INTERVAL: (d - X - Y - 1) == (d - (X+Y+1)).
  -- The delay map is DEDUPLICATED first — see note C.
  ------------------------------------------------------------------
  CREATE TEMP TABLE tmp_business_logic
  PARTITION BY report_date
  CLUSTER BY Product_Name_Final, AFID_Suffix, Country_Code, billing_cycle
  AS
  WITH
    report_dates AS (
      SELECT d AS report_date
      FROM UNNEST(GENERATE_DATE_ARRAY(v_report_end_date, v_report_start_date, INTERVAL 1 DAY)) AS d
    ),
    billing_cycles AS (
      SELECT bc AS billing_cycle
      FROM UNNEST(GENERATE_ARRAY(0, v_max_billing_cycles)) AS bc
    ),
    delay_map AS (
      SELECT `Plan Name` AS Plan_Name, MIN(`Delay days`) AS Delay_days
      FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Plan_SOTDays_Map`
      GROUP BY 1
    )
  SELECT
    rd.report_date,
    apl.Product_Name_Final,
    apl.AFID_Suffix,
    apl.Country_Code,
    apl.Currency,
    bc.billing_cycle,
    apl.Entity_Name, apl.App_Name, apl.Trial_Type, apl.Trial_Period,
    apl.Trial_Price, apl.Regular_Price,
    COALESCE(dm.Delay_days, v_default_regular_bc) AS calculated_regular_bc_period,

    CASE
      WHEN bc.billing_cycle = 0 THEN 0
      WHEN bc.billing_cycle = 1 AND apl.Trial_Type =  'NT' THEN 1
      WHEN bc.billing_cycle = 1 AND apl.Trial_Type != 'NT' THEN 0
      ELSE bc.billing_cycle - 1
    END AS calculated_denominator_bc,

    CASE
      WHEN apl.Trial_Type != 'NT' AND bc.billing_cycle = 0 THEN
        DATE_SUB(rd.report_date, INTERVAL apl.Trial_Period + 1 DAY)
      WHEN apl.Trial_Type != 'NT' AND bc.billing_cycle >= 1 THEN
        DATE_SUB(rd.report_date,
          INTERVAL apl.Trial_Period
                 + bc.billing_cycle * COALESCE(dm.Delay_days, v_default_regular_bc)
                 + 1 DAY)
      WHEN apl.Trial_Type = 'NT' AND bc.billing_cycle = 0 THEN rd.report_date
      WHEN apl.Trial_Type = 'NT' AND bc.billing_cycle >= 1 THEN
        DATE_SUB(rd.report_date,
          INTERVAL bc.billing_cycle * COALESCE(dm.Delay_days, v_default_regular_bc)
                 + 1 DAY)
    END AS calculated_bc_start_date,

    CASE
      WHEN apl.Trial_Type != 'NT' AND bc.billing_cycle = 0 THEN 0
      WHEN apl.Trial_Type != 'NT' AND bc.billing_cycle = 1 THEN apl.Trial_Period
      WHEN apl.Trial_Type != 'NT' AND bc.billing_cycle >= 2 THEN
        apl.Trial_Period + ((bc.billing_cycle - 1) * COALESCE(dm.Delay_days, v_default_regular_bc))
      WHEN apl.Trial_Type = 'NT' AND bc.billing_cycle = 0 THEN 0
      WHEN apl.Trial_Type = 'NT' AND bc.billing_cycle = 1 THEN 0
      WHEN apl.Trial_Type = 'NT' AND bc.billing_cycle >= 2 THEN
        (bc.billing_cycle - 1) * COALESCE(dm.Delay_days, v_default_regular_bc)
    END AS calculated_start_offset_days,

    CASE
      WHEN apl.Trial_Type != 'NT' AND bc.billing_cycle = 0 THEN apl.Trial_Period - 1
      WHEN apl.Trial_Type != 'NT' AND bc.billing_cycle >= 1 THEN
        apl.Trial_Period + (bc.billing_cycle * COALESCE(dm.Delay_days, v_default_regular_bc)) - 1
      WHEN apl.Trial_Type = 'NT' AND bc.billing_cycle = 0 THEN 0
      WHEN apl.Trial_Type = 'NT' AND bc.billing_cycle >= 1 THEN
        (bc.billing_cycle * COALESCE(dm.Delay_days, v_default_regular_bc)) - 1
    END AS calculated_end_offset_days,

    IF(apl.Trial_Type = 'NT', 1, 0) AS cohort_selection_bc

  FROM tmp_agg_plan_list apl
  CROSS JOIN report_dates rd
  CROSS JOIN billing_cycles bc
  LEFT JOIN delay_map dm
    ON dm.Plan_Name = apl.Product_Name_Final;

  ------------------------------------------------------------------
  -- TEMP 3 — Fact table, scanned ONCE
  -- Your original scans it twice: eligible_transactions and
  -- all_customer_refunds. The filter keeps every row either scan needed:
  -- cohort selection only ever uses Billing_Cycle_Updated 0 or 1
  -- (cohort_selection_bc is 1 for NT, 0 otherwise), and the refund side
  -- requires Refund_Amount_USD > 0 AND Refund_Date IS NOT NULL.
  --
  -- AFID IS NOT NULL is safe to push down: your join condition is
  --   (bl.AFID_Suffix IS NULL AND base.AFID IS NULL) OR bl.AFID_Suffix = base.AFID
  -- and bl.AFID_Suffix is never NULL (see note A), so base rows with a NULL
  -- AFID could never have matched anyway.
  --
  -- NOTE: no Currency column and no Currency filter — this variant joins
  -- the base table without one, unlike IC_Refund_Table_24BC.
  ------------------------------------------------------------------
  CREATE TEMP TABLE tmp_base_facts
  CLUSTER BY Product_Name_Final, AFID, derived_country_code
  AS
  SELECT
    b.Updated_Cust_ID,
    b.Product_Name_Final_Merged AS Product_Name_Final,
    b.AFID,
    b.Billing_Cycle_Updated,
    b.Date_of_Sale,
    b.Refund_Date,
    b.Refund_Amount_USD,
    b.Order_Id,
    IF(b.Spend_Country_Code_AFID = 'JP', 'JP', 'Non-JP') AS derived_country_code
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` b
  WHERE b.Product_Name_Final_Merged IS NOT NULL
    AND b.AFID IS NOT NULL
    AND (
      b.Billing_Cycle_Updated IN (0, 1)
      OR (b.Refund_Amount_USD > 0 AND b.Refund_Date IS NOT NULL)
    );

  ------------------------------------------------------------------
  -- TEMP 4 — Pre-rank ONCE
  -- Your eligible pool is ranked separately for every
  -- (report_date x billing_cycle) row. But cohort_selection_bc depends only
  -- on Trial_Type, which is fixed per (Product, Country, AFID_Suffix), so
  -- the eligible pool is IDENTICAL across report dates and billing cycles —
  -- only the Date_of_Sale cutoff moves. Rank once.
  -- r_country covers the JP / Non-JP branches; r_all the no-filter branch.
  ------------------------------------------------------------------
  CREATE TEMP TABLE tmp_ranked_base
  CLUSTER BY Product_Name_Final, AFID, Billing_Cycle_Updated
  AS
  SELECT
    Product_Name_Final,
    AFID,
    Billing_Cycle_Updated,
    derived_country_code,
    Updated_Cust_ID,
    Date_of_Sale,
    ROW_NUMBER() OVER (
      PARTITION BY Product_Name_Final, AFID, Billing_Cycle_Updated, derived_country_code
      ORDER BY Date_of_Sale DESC
    ) AS r_country,
    ROW_NUMBER() OVER (
      PARTITION BY Product_Name_Final, AFID, Billing_Cycle_Updated
      ORDER BY Date_of_Sale DESC
    ) AS r_all
  FROM tmp_base_facts
  WHERE Billing_Cycle_Updated IN (0, 1)
    AND Date_of_Sale IS NOT NULL;

  ------------------------------------------------------------------
  -- TEMP 5 — Cohort start rank
  -- r_start = smallest rank whose Date_of_Sale <= cutoff. Because rank is
  -- ORDER BY Date_of_Sale DESC, that row is exactly "rank 1 of the eligible
  -- pool" in your original, so r_start .. r_start + 6999 is your top 7000.
  ------------------------------------------------------------------
  CREATE TEMP TABLE tmp_cohort_bounds AS

  -- Branch C: JP / Non-JP (your first two OR branches)
  SELECT
    bl.report_date, bl.Product_Name_Final, bl.AFID_Suffix, bl.Country_Code,
    bl.billing_cycle, bl.cohort_selection_bc,
    'C' AS branch,
    MIN(rb.r_country) AS r_start
  FROM tmp_business_logic bl
  JOIN tmp_ranked_base rb
    ON  rb.Product_Name_Final    = bl.Product_Name_Final
    AND rb.AFID                  = bl.AFID_Suffix
    AND rb.Billing_Cycle_Updated = bl.cohort_selection_bc
    AND rb.derived_country_code  = bl.Country_Code
  WHERE bl.Country_Code IN ('JP', 'Non-JP')
    AND rb.Date_of_Sale <= bl.calculated_bc_start_date
  GROUP BY 1,2,3,4,5,6

  UNION ALL

  -- Branch A: NULL / blank Country_Code — no country filter (your third branch)
  SELECT
    bl.report_date, bl.Product_Name_Final, bl.AFID_Suffix, bl.Country_Code,
    bl.billing_cycle, bl.cohort_selection_bc,
    'A' AS branch,
    MIN(rb.r_all) AS r_start
  FROM tmp_business_logic bl
  JOIN tmp_ranked_base rb
    ON  rb.Product_Name_Final    = bl.Product_Name_Final
    AND rb.AFID                  = bl.AFID_Suffix
    AND rb.Billing_Cycle_Updated = bl.cohort_selection_bc
  WHERE (bl.Country_Code IS NULL OR TRIM(bl.Country_Code) = '')
    AND rb.Date_of_Sale <= bl.calculated_bc_start_date
  GROUP BY 1,2,3,4,5,6;

  ------------------------------------------------------------------
  -- TEMP 6 — Selected cohort (integer range expansion)
  -- Equivalent to your transaction_rank <= cohort_size filter.
  ------------------------------------------------------------------
  CREATE TEMP TABLE tmp_selected_cohort
  PARTITION BY report_date
  CLUSTER BY Product_Name_Final, AFID_Suffix, Country_Code, Updated_Cust_ID
  AS

  SELECT
    cb.report_date, cb.Product_Name_Final, cb.AFID_Suffix, cb.Country_Code,
    cb.billing_cycle,
    rb.Updated_Cust_ID,
    rb.Date_of_Sale AS original_purchase_date
  FROM tmp_cohort_bounds cb
  JOIN tmp_ranked_base rb
    ON  rb.Product_Name_Final    = cb.Product_Name_Final
    AND rb.AFID                  = cb.AFID_Suffix
    AND rb.Billing_Cycle_Updated = cb.cohort_selection_bc
    AND rb.derived_country_code  = cb.Country_Code
    AND rb.r_country BETWEEN cb.r_start AND cb.r_start + v_cohort_size - 1
  WHERE cb.branch = 'C'

  UNION ALL

  SELECT
    cb.report_date, cb.Product_Name_Final, cb.AFID_Suffix, cb.Country_Code,
    cb.billing_cycle,
    rb.Updated_Cust_ID,
    rb.Date_of_Sale AS original_purchase_date
  FROM tmp_cohort_bounds cb
  JOIN tmp_ranked_base rb
    ON  rb.Product_Name_Final    = cb.Product_Name_Final
    AND rb.AFID                  = cb.AFID_Suffix
    AND rb.Billing_Cycle_Updated = cb.cohort_selection_bc
    AND rb.r_all BETWEEN cb.r_start AND cb.r_start + v_cohort_size - 1
  WHERE cb.branch = 'A';

  ------------------------------------------------------------------
  -- TEMP 7 — Exchange rates
  -- LOGIC PRESERVED: AVG(Value_USD) over ALL rows dated on or before
  -- BC_start_date — a cumulative average over history, exactly as your
  -- original. It only depends on (Currency, BC_start_date), so it is
  -- computed once per distinct pair instead of once per business_logic row.
  ------------------------------------------------------------------
  CREATE TEMP TABLE tmp_fx
  CLUSTER BY Currency, calculated_bc_start_date
  AS
  WITH distinct_lookups AS (
    SELECT DISTINCT Currency, calculated_bc_start_date
    FROM tmp_business_logic
    WHERE Currency != 'USD'
  )
  SELECT
    d.Currency,
    d.calculated_bc_start_date,
    COALESCE(AVG(er.Value_USD), 1.0) AS final_exchange_rate
  FROM distinct_lookups d
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_Dim_Exchnage_Rate` er
    ON  er.Currency = d.Currency
    AND er.Date    <= d.calculated_bc_start_date
  GROUP BY 1,2;

  ------------------------------------------------------------------
  -- FINAL — build into staging, then swap
  -- Staging + swap because CREATE OR REPLACE cannot change a table's
  -- partitioning spec; writing straight to the live table would make this
  -- last statement fail and discard everything above it.
  ------------------------------------------------------------------
  CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID_24BC_staging`
  PARTITION BY Report_date
  CLUSTER BY Product_Name_Final, AFID_Suffix, Country_Code, Billing_Cycle
  AS
  WITH
    cohort_summary AS (
      SELECT
        report_date, Product_Name_Final, AFID_Suffix, Country_Code, billing_cycle,
        COUNT(*)                    AS actual_cohort_count,
        MIN(original_purchase_date) AS calculated_bc_end_date
      FROM tmp_selected_cohort
      GROUP BY 1,2,3,4,5
    ),

    -- Refund calculation: identical filter/window logic and NT-BC0 zero rule.
    -- The cohort -> facts join intentionally fans out when a customer has
    -- more than one qualifying purchase, exactly as your original did:
    -- COUNT(DISTINCT Order_Id) dedups but SUM(Refund_Amount_USD) does not.
    refund_metrics AS (
      SELECT
        sc.report_date,
        sc.Product_Name_Final,
        sc.AFID_Suffix,
        sc.Country_Code,
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
        AND bl.AFID_Suffix        = sc.AFID_Suffix
        AND bl.Country_Code       = sc.Country_Code
        AND bl.billing_cycle      = sc.billing_cycle
      JOIN tmp_base_facts bf
        ON  bf.Updated_Cust_ID    = sc.Updated_Cust_ID
        AND bf.Product_Name_Final = sc.Product_Name_Final
        AND bf.AFID               = sc.AFID_Suffix
        AND (
          sc.Country_Code IS NULL OR TRIM(sc.Country_Code) = ''
          OR bf.derived_country_code = sc.Country_Code
        )
      WHERE bf.Refund_Amount_USD > 0
        AND bf.Refund_Date IS NOT NULL
        AND bf.Refund_Date BETWEEN
              DATE_ADD(sc.original_purchase_date, INTERVAL bl.calculated_start_offset_days DAY)
          AND DATE_ADD(sc.original_purchase_date, INTERVAL bl.calculated_end_offset_days DAY)
      GROUP BY 1,2,3,4,5,6
    ),

    -- core_metrics + final_calculations. No currency-collapse step in this
    -- variant: the output grain equals the business_logic grain.
    assembled AS (
      SELECT
        bl.report_date,
        bl.Product_Name_Final,
        bl.AFID_Suffix,
        bl.Country_Code,
        bl.Currency,
        bl.billing_cycle,
        bl.Entity_Name, bl.App_Name, bl.Trial_Type, bl.Trial_Period,
        bl.Trial_Price, bl.Regular_Price,
        bl.calculated_regular_bc_period,
        bl.calculated_denominator_bc,
        bl.calculated_bc_start_date,
        bl.calculated_start_offset_days,
        bl.calculated_end_offset_days,
        IF(bl.Currency = 'USD', 1.0, COALESCE(fx.final_exchange_rate, 1.0)) AS final_exchange_rate,
        cs.calculated_bc_end_date,
        -- Identical to your original: NULL when no cohort row exists
        CASE WHEN cs.actual_cohort_count = v_cohort_size THEN v_cohort_size
             ELSE cs.actual_cohort_count END AS final_cohort_final_users,
        COALESCE(rm.clean_refund_count, 0)    AS clean_refund_count,
        COALESCE(rm.clean_refund_amount, 0.0) AS clean_refund_amount
      FROM tmp_business_logic bl
      LEFT JOIN tmp_fx fx
        ON  fx.Currency                 = bl.Currency
        AND fx.calculated_bc_start_date = bl.calculated_bc_start_date
      LEFT JOIN cohort_summary cs
        ON  cs.report_date        = bl.report_date
        AND cs.Product_Name_Final = bl.Product_Name_Final
        AND cs.AFID_Suffix        = bl.AFID_Suffix
        AND cs.Country_Code       = bl.Country_Code
        AND cs.billing_cycle      = bl.billing_cycle
      LEFT JOIN refund_metrics rm
        ON  rm.report_date        = bl.report_date
        AND rm.Product_Name_Final = bl.Product_Name_Final
        AND rm.AFID_Suffix        = bl.AFID_Suffix
        AND rm.Country_Code       = bl.Country_Code
        AND rm.billing_cycle      = bl.billing_cycle
    ),

    -- final_calculations: the ratio, with the data-quality filter.
    -- Both original branches divide refund_amount by (price * fx) and then
    -- by cohort users, differing only in which price. Written once here
    -- with the price selected inline — arithmetically identical.
    scored AS (
      SELECT
        a.*,
        COALESCE(
          SAFE_DIVIDE(
            SAFE_DIVIDE(
              a.clean_refund_amount,
              NULLIF(IF(a.billing_cycle = 0, a.Trial_Price, a.Regular_Price) * a.final_exchange_rate, 0)
            ),
            NULLIF(a.final_cohort_final_users, 0)
          ), 0.0
        ) AS raw_ratio
      FROM assembled a
    )

  -- Column names and order match your original exactly
  SELECT
    s.report_date        AS Report_date,
    s.Product_Name_Final,
    s.AFID_Suffix,
    s.billing_cycle      AS Billing_Cycle,
    v_cohort_size        AS Cohort_Size,
    v_minimum_user_count AS Minimum_User_count,
    v_retry_engine_period AS Retry_engine_Period,
    s.Entity_Name,
    CASE
      WHEN s.Country_Code IS NULL OR s.Country_Code = '' THEN s.App_Name
      ELSE CONCAT(s.App_Name, '-', s.Country_Code)
    END                  AS App_Name,
    s.Trial_Type,
    s.Trial_Period,
    s.Currency,
    s.Trial_Price,
    s.Regular_Price,
    s.Country_Code,
    s.calculated_regular_bc_period AS Regular_BC_period,
    s.final_exchange_rate          AS Exchange_rate,
    s.calculated_denominator_bc    AS Denominator_BC,
    s.calculated_bc_start_date     AS BC_start_date,
    s.calculated_bc_end_date       AS BC_end_date,
    s.calculated_start_offset_days AS start_offset_days,
    s.calculated_end_offset_days   AS end_offset_days,
    s.final_cohort_final_users     AS Cohort_final_users,
    s.clean_refund_count           AS Refund_Count,
    s.clean_refund_amount          AS Refund_Amount,
    CASE
      WHEN s.billing_cycle = 0 AND s.Trial_Type = 'NT' THEN 0.0
      WHEN s.raw_ratio > v_refund_ratio_threshold
           AND s.clean_refund_count < v_minimum_refund_count THEN 0.0
      ELSE s.raw_ratio
    END AS Refund_Ratio
  FROM scored s;
  -- deliberately NO ORDER BY

  ------------------------------------------------------------------
  -- SWAP — two metadata operations, seconds regardless of size.
  -- Safe whether or not the live table exists, and regardless of its
  -- current partitioning spec, so this procedure is always re-runnable.
  ------------------------------------------------------------------
  DROP TABLE IF EXISTS `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID_24BC`;

  ALTER TABLE `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID_24BC_staging`
    RENAME TO IC_Refund_Table_AFID_24BC;

  ------------------------------------------------------------------
  -- CLEANUP
  ------------------------------------------------------------------
  DROP TABLE IF EXISTS tmp_agg_plan_list;
  DROP TABLE IF EXISTS tmp_business_logic;
  DROP TABLE IF EXISTS tmp_base_facts;
  DROP TABLE IF EXISTS tmp_ranked_base;
  DROP TABLE IF EXISTS tmp_cohort_bounds;
  DROP TABLE IF EXISTS tmp_selected_cohort;
  DROP TABLE IF EXISTS tmp_fx;

END;
