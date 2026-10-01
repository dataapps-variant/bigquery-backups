-- =====================================================
-- IC REFUND TABLE AFID 24BC — OPTIMIZED
-- Optimization of proc_IC_Refund_Table_AFID_24BC. Same structure as the
-- other optimized procedures: one procedure, CREATE TEMP TABLE stages,
-- staging table + swap at the end.
--
-- LOGIC PRESERVED (identical to your original):
--   - Grain: Report_date x Product x Country_Code x AFID_Suffix x BC
--   - AFID_Suffix matched against base.AFID (NOT AFID_CHANNEL)
--   - NO Currency condition on any base-table join (this variant differs
--     from IC_Refund_Table_24BC, which filters on Currency)
--   - Plan aggregation at (Product, Country_Code, AFID_Suffix):
--     winner row by MIN(Trial_Price), Trial_Price replaced by group AVG
--   - refund_ratio_threshold = 0.00, minimum_refund_count = 30
--   - max_billing_cycles = 24
--   - Denominator_BC, BC_start_date, both offset calculations
--   - Cohort: top 7000 by Date_of_Sale DESC, per Country_Code branch
--   - FX = AVG(Value_USD) over all dates <= BC_start_date
--   - Refund window, NT-BC0 zeroing, data-quality filter
--   - Cohort_final_users NULL when no cohort row exists
--   - NO currency-collapse step: output is one row per business_logic row
--   - Output schema: same 26 columns, same names, same order
--
-- PERFORMANCE CHANGES (no math changes):
--   1. Fact table scanned ONCE (your original scans it twice:
--      eligible_transactions and all_customer_refunds)
--   2. Cohort ranked ONCE per (plan, AFID_Suffix, country, BC) instead of
--      re-ranking for every (report_date x billing_cycle) row
--   3. master_combinations no longer cross-joins EVERY AFID_Suffix against
--      EVERY product before the INNER JOIN discards the invalid pairs
--   4. Country OR(...) block replaced by equality on derived_country_code
--   5. The eight NULL-safe AFID_Suffix joins collapse to plain equality —
--      see note A for why that is exactly equivalent here
--   6. FX deduplicated to (Currency, BC_start_date) before the range join
--   7. Column pruning on the fact scan
--   8. Final ORDER BY removed; output partitioned and clustered
-- =====================================================

CREATE OR REPLACE PROCEDURE `variant-finance-data-project.Icarus_Cohort.proc_IC_Refund_Table_AFID_24BC`()
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


-- =====================================================
-- NOTES — DIVERGENCE RISKS, AND HOW TO CHECK EACH
-- =====================================================
--
-- A. The eight NULL-safe AFID_Suffix joins are dead code
--    Your plan_list CTEs filter WHERE AFID_Suffix IS NOT NULL, so
--    aggregated_plan_list never contains a NULL AFID_Suffix, so afid_list
--    never does, so master_combinations never does, so business_logic never
--    does. Every
--        (a.AFID_Suffix IS NULL AND b.AFID_Suffix IS NULL) OR a.X = b.X
--    branch therefore reduces to plain equality — the NULL arm can never
--    fire. This version uses plain equality, which is exactly equivalent and
--    lets BigQuery hash-join instead of falling back on the disjunction.
--    The same reasoning lets AFID IS NOT NULL be pushed into the fact scan.
--    CONFIRM (should return 0):
--      SELECT COUNTIF(AFID_Suffix IS NULL) AS null_suffix
--      FROM `variant-finance-data-project.Icarus_Cohort.IC_Plan_List_AFID_24BC`
--      WHERE Product_Name_Final IS NOT NULL;
--    If this is somehow non-zero it still does not matter — the
--    AFID_Suffix IS NOT NULL filter in TEMP 1 removes those rows, exactly
--    as your original does.
--
-- B. Plans with a NULL Country_Code lose their metrics
--    core_metrics joins exchange_rates, cohort_analysis and refund_metrics
--    with plain equality on Country_Code. NULL = NULL is NULL, not TRUE, so
--    any plan whose Country_Code is NULL gets a NULL exchange rate, NULL
--    Cohort_final_users and zero refunds — even though the cohort was built
--    by the branch-A path. Preserved here so the numbers reconcile.
--    Blank strings ('') are fine: '' = '' is TRUE. Only NULL is affected.
--    CHECK:
--      SELECT COUNTIF(Country_Code IS NULL) AS null_country,
--             COUNTIF(TRIM(COALESCE(Country_Code,'x')) = '') AS blank_country,
--             COUNT(*) AS total
--      FROM `variant-finance-data-project.Icarus_Cohort.IC_Plan_List_AFID_24BC`
--      WHERE Product_Name_Final IS NOT NULL AND AFID_Suffix IS NOT NULL;
--    null_country = 0 -> nothing to do. Otherwise switch those three joins
--    to the NULL-safe form:
--      AND (a.Country_Code = b.Country_Code
--           OR (a.Country_Code IS NULL AND b.Country_Code IS NULL))
--
-- C. Duplicate `Plan Name` in Sticky_Dim_Plan_SOTDays_Map
--    Your original joined this map raw inside business_logic. Duplicates
--    would multiply every business_logic row and inflate everything
--    downstream. TEMP 2 deduplicates with MIN(`Delay days`).
--    CHECK:
--      SELECT `Plan Name`, COUNT(*) c
--      FROM `variant-finance-data-project.Sticky_Data.Sticky_Dim_Plan_SOTDays_Map`
--      GROUP BY 1 HAVING c > 1;
--
-- D. refund_ratio_threshold is 0.00
--    The data-quality filter is "ratio > threshold AND count < 30". At a
--    threshold of 0.00 that forces ANY non-zero ratio backed by fewer than
--    30 refunds to 0.0 — not just implausibly high ones. Preserved as
--    written, but worth confirming it is intentional rather than inherited.
--    CHECK how much is being suppressed:
--      SELECT COUNTIF(Refund_Ratio = 0 AND Refund_Amount > 0) AS suppressed,
--             COUNT(*) AS rows_
--      FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID_24BC`
--      WHERE Report_date = DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY);
--
-- E. No Currency condition on the base joins — deliberate
--    IC_Refund_Table_24BC filters base-table joins on Currency; this variant
--    does not, and Currency is only an attribute of the plan row. That means
--    a plan billed in several currencies pools all of them into one cohort
--    and one refund total, while Exchange_rate comes from the single
--    winner-row Currency. Preserved exactly, but if the two IC tables are
--    ever compared side by side, this is why their numbers differ.
--    CHECK whether any plan actually spans currencies:
--      SELECT Product_Name_Final, COUNT(DISTINCT Currency) AS currencies
--      FROM `variant-finance-data-project.Icarus_Cohort.IC_Plan_List_AFID_24BC`
--      WHERE Product_Name_Final IS NOT NULL AND AFID_Suffix IS NOT NULL
--      GROUP BY 1 HAVING COUNT(DISTINCT Currency) > 1;
--    Empty -> the distinction is moot for your data.
--
-- F. Non-deterministic tie-breaking (inherent to BOTH versions)
--    Neither version specifies a tie-breaker for plan rows tied on
--    Trial_Price, or for transactions tied on Date_of_Sale at rank 7000.
--    Two runs of the SAME query can differ slightly at those boundaries.
--    For reproducible output add a tie-breaker to both ORDER BY clauses.
--    Deliberate behaviour change — do it on its own and re-baseline.
--
--
-- =====================================================
-- DEPLOYMENT — run these IN ORDER
-- =====================================================
--
-- STEP 1 — Back up the current table  (DO NOT SKIP)
-- The swap at the end of the procedure drops the existing table.
--
-- CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID_24BC_backup`
-- AS SELECT * FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID_24BC`;
--
-- STEP 2 — Check what the swap costs you
-- Table-level IAM grants, description and labels do NOT survive the DROP
-- inside the swap. If anyone has access granted on the table directly rather
-- than on the Icarus_Cohort dataset, they lose it and you must re-grant.
--   bq show --format=prettyjson variant-finance-data-project:Icarus_Cohort.IC_Refund_Table_AFID_24BC
--
-- STEP 3 — Deploy the procedure
-- Select everything from the CREATE OR REPLACE PROCEDURE line down to the
-- final END; (everything above the NOTES banner) and run it. Takes about a
-- second — it only stores the definition, it does not execute anything.
--
-- STEP 4 — Run it
-- CALL `variant-finance-data-project.Icarus_Cohort.proc_IC_Refund_Table_AFID_24BC`();
--
-- Deploying and calling are separate steps. Running only the CALL
-- re-executes whatever body is already stored. To confirm the new body:
--   SELECT routine_name, STRPOS(ddl, 'tmp_ranked_base') > 0 AS is_optimized
--   FROM `variant-finance-data-project.Icarus_Cohort.INFORMATION_SCHEMA.ROUTINES`
--   WHERE routine_name = 'proc_IC_Refund_Table_AFID_24BC';
--
-- STEP 5 — Sanity check
-- SELECT COUNT(*) AS rows_, MIN(Report_date) AS lo, MAX(Report_date) AS hi,
--        COUNT(DISTINCT Report_date) AS days,
--        DATE_DIFF(MAX(Report_date), MIN(Report_date), DAY) + 1 AS expected_days,
--        COUNT(DISTINCT AFID_Suffix) AS suffixes
-- FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID_24BC`;
--
-- This variant has NO First_Date_of_Sale prune, so every plan gets every
-- report date: days must equal expected_days.
--
-- STEP 6 — Reconcile against the backup  (THE IMPORTANT ONE)
-- SELECT
--   COUNT(*)                                                            AS rows_compared,
--   COUNTIF(n.Report_date IS NULL)                                      AS missing_in_new,
--   COUNTIF(o.Report_date IS NULL)                                      AS extra_in_new,
--   COUNTIF(n.Cohort_final_users IS DISTINCT FROM o.Cohort_final_users) AS cohort_diffs,
--   COUNTIF(n.Refund_Count       IS DISTINCT FROM o.Refund_Count)       AS count_diffs,
--   COUNTIF(ABS(n.Refund_Amount - o.Refund_Amount) > 0.01)              AS amount_diffs,
--   COUNTIF(ABS(n.Refund_Ratio  - o.Refund_Ratio)  > 0.0001)            AS ratio_diffs
-- FROM      `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID_24BC`        n
-- FULL JOIN `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID_24BC_backup` o
--   USING (Report_date, Product_Name_Final, AFID_Suffix, Billing_Cycle, Country_Code)
-- WHERE COALESCE(n.Report_date, o.Report_date) BETWEEN '2025-06-01' AND '2025-06-30';
--
-- Rows where Country_Code IS NULL will not match in this FULL JOIN (USING
-- uses plain equality), so they appear as both missing_in_new and
-- extra_in_new. That is an artefact of the comparison, not a real diff.
-- Exclude them with: AND COALESCE(n.Country_Code, o.Country_Code) IS NOT NULL
--
-- Anything else non-zero: see notes B / C / F.
--
-- STEP 7 — Clean up, later
-- Keep IC_Refund_Table_AFID_24BC_backup for a few cycles before dropping it.
--
--
-- =====================================================
-- IF A RUN EVER FAILS
-- =====================================================
-- The staging build means a failed run leaves the live table untouched —
-- the expensive CTAS lands in staging, and the swap only runs if everything
-- before it succeeded. If something goes wrong during the swap itself:
--
-- CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID_24BC`
-- PARTITION BY Report_date
-- CLUSTER BY Product_Name_Final, AFID_Suffix, Country_Code, Billing_Cycle
-- AS SELECT * FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID_24BC_backup`;
--
--
-- =====================================================
-- DOWNSTREAM QUERIES
-- =====================================================
-- Output is PARTITIONED by Report_date, CLUSTERED by Product_Name_Final,
-- AFID_Suffix, Country_Code, Billing_Cycle. Filtering on Report_date prunes
-- partitions:  WHERE Report_date BETWEEN '2025-06-01' AND '2025-06-30'
-- A query with no Report_date filter still reads every partition.
