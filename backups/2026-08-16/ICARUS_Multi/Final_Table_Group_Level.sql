-- =====================================================
-- FINAL TABLE - GROUP LEVEL
-- Aggregate all products across all apps into one group
--
-- GRAIN: Report_date × Billing_Cycle × Cohort × Table_Type
-- No App_Name, Country_Code, or Active_Inactive
--
-- =====================================================
-- COLUMN LOGIC (BRIEF)
-- =====================================================
--
-- DIMENSIONS (4):
--   1. Reporting_Date       — From product-level UNION
--   2. BC                   — Billing_Cycle 0–12
--   3. Cohort               — '7K_30D' or '7K' based on source table
--   4. Table                — 'Crystal Ball' or 'Regular' based on source table
--
-- SIMPLE SUM FROM PRODUCT-LEVEL TABLES (2):
--   5. Subscriptions        — SUM(Subscription_users) across all products/apps/countries
--   6. Rebills              — SUM(CB_User) for Crystal Ball; SUM(Rebill_users) for Regular
--
-- WEIGHTED AVG FROM PRODUCT-LEVEL TABLES (1):
--   7. Refund_Rate          — SUM(Refund_ratio × weight) / SUM(weight)
--                             weight = CB_Value (CB) or Rebill_value (Regular)
--                             NULL from First_Null_BC onward
--
-- DERIVED AT GROUP LEVEL — CHURN & RETENTION (4):
--   8. Churn_Rate           — BC0=0; BC1+: 1 - (Grp_Rebills / Grp_Subscriptions)
--                             NULL from First_Null_BC onward
--   9. Gross_ARPU_Retention_Rate — BC0=1.0; BC1+: cumulative product of (1-churn)
--                             NULL cascade: Rebills < 25 at BC>=1 triggers NULL forward
--  10. Net_ARPU_Retention_Rate   — Retention - Refund_Rate; NULL when Retention NULL
--  11. Cumulative_Refund_Rate    — Running SUM of Refund_Rate over BC; NULL from First_Null_BC
--
-- SINGLE SALE — SUM FROM PRODUCT-LEVEL TABLES (1):
--  12. Single_Sale          — SUM(SS_Users) at BC0; fallback BC1 if 0/NULL; broadcast all BCs
--
-- RECENT_CAC — RECOMPUTED FROM SOURCE TABLES (1):
--  13. Recent_CAC           — ONE global last_spend_date = MAX(Date) from spend table
--                             Recent_Spend = SUM(allocated_spend) in 7-day window
--                             Recent_Users = COUNT(DISTINCT) in same window (NT→BC1, else→BC0)
--                             Recent_CAC = Recent_Spend / Recent_Users
--                             Same for all BCs/Cohort/Table; broadcast everywhere
--
-- T30D_NEW_USERS — RECOMPUTED FROM SOURCE (1):
--  14. T30D_New_Users       — COUNT(DISTINCT Updated_Cust_ID) over 30 days
--                             NT→BC1, else→BC0 filter, no product/country filter
--                             Same for all BCs/Cohort/Table
--
-- T7D_NEW_USERS — RECOMPUTED FROM SOURCE (1):
--  15. T7D_New_Users        — Recent_Users (from 7-day window above) / 7
--                             Same for all BCs/Cohort/Table
--
-- DAILY METRICS — RECOMPUTED FROM SOURCE TABLES (5):
--  16. Daily_Allocated_Spend — SUM(allocated_spend) WHERE Date = Report_date
--  17. Daily_New_Users       — COUNT(DISTINCT) on exact date; NT→BC1, else→BC0
--  18. Daily_SS_Users        — COUNT(DISTINCT) on exact date; RIGHT(Product_name_Final,2)='SS', BC0
--  19. T7D_Daily_SS_Users    — Trailing 7-day avg: per-day COUNT DISTINCT SS, sum/7
--  20. Daily_CAC             — Daily_Allocated_Spend / Daily_New_Users; NULL if denom=0
--     All daily metrics: no product/country filter, same for all BCs/Cohort/Table
--
-- ARPU / LTV — DERIVED AT GROUP LEVEL (3):
--  21. Gross_ARPU_Discounted — Per-BC: (SUM(value_weight)/SUM(Rebills)) × Retention
--                              + SUM(SS_Value)/SUM(Subscriptions)
--                              Then cumulative SUM over BCs; NULL from First_Null_BC
--  22. Net_ARPU_Discounted   — Same but (Retention - Refund) instead of Retention
--                              Then cumulative SUM; NULL from First_Null_BC
--  23. Net_LTV_Discounted    — Cumulative Net_ARPU - Recent_CAC; NULL from First_Null_BC
--
-- BC4 CAC CEILING (1):
--  24. BC4_CAC_Ceiling       — Cumulative Net_ARPU at BC=4 minus $1.2
--                              Broadcast all BCs; excluded from NULL cascade
--                              NULL if Grp_Subscriptions=0 AND Grp_Rebills=0
--
-- SOURCES:
--   1. ICARUS_Multi.7K_30D_Crystal_Ball     (Cohort=7K_30D, Table=Crystal Ball)
--   2. ICARUS_Multi.7K_Crystal_Ball         (Cohort=7K,     Table=Crystal Ball)
--   3. ICARUS_Multi.7K_30D_Main_Table       (Cohort=7K_30D, Table=Regular)
--   4. ICARUS_Multi.7K_Main_Table           (Cohort=7K,     Table=Regular)
--   5. Ad_spend_data.Merged_Spend_Split_TBL (Daily & Recent Spend)
--   6. Sticky_Data.Sticky_data_API_original_V_Merged_TBL (Daily/Recent/T30D Users, SS)
--
-- OUTPUT: 24 columns
-- =====================================================

CREATE OR REPLACE TABLE `variant-finance-data-project.ICARUS_Multi.Final_Table_Group_Level` AS

WITH
-- =====================================================
-- STEP 1: UNION ALL 4 PRODUCT-LEVEL TABLES
-- Standardize column names across Crystal Ball and Regular
-- =====================================================
unioned_product_data AS (

  -- Table 1: 7K_30D Crystal Ball
  SELECT
    Report_date,
    Billing_Cycle,
    Subscription_users,
    CB_User          AS Rebills_raw,
    CB_Value         AS Value_weight,
    COALESCE(Refund_ratio, 0) AS Refund_ratio_raw,
    CB_Value         AS Refund_weight,
    SS_Users,
    Single_Sale_Value,
    '7K_30D'         AS Cohort,
    'Crystal Ball'   AS Table_Type
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball`

  UNION ALL

  -- Table 2: 7K Crystal Ball
  SELECT
    Report_date,
    Billing_Cycle,
    Subscription_users,
    CB_User          AS Rebills_raw,
    CB_Value         AS Value_weight,
    COALESCE(Refund_ratio, 0) AS Refund_ratio_raw,
    CB_Value         AS Refund_weight,
    SS_Users,
    Single_Sale_Value,
    '7K'             AS Cohort,
    'Crystal Ball'   AS Table_Type
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`

  UNION ALL

  -- Table 3: 7K_30D Main Table
  SELECT
    Report_date,
    Billing_Cycle,
    Subscription_users,
    Rebill_users     AS Rebills_raw,
    Rebill_value     AS Value_weight,
    COALESCE(Refund_ratio, 0) AS Refund_ratio_raw,
    Rebill_value     AS Refund_weight,
    SS_Users,
    Single_Sale_Value,
    '7K_30D'         AS Cohort,
    'Regular'        AS Table_Type
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`

  UNION ALL

  -- Table 4: 7K Main Table
  SELECT
    Report_date,
    Billing_Cycle,
    Subscription_users,
    Rebill_users     AS Rebills_raw,
    Rebill_value     AS Value_weight,
    COALESCE(Refund_ratio, 0) AS Refund_ratio_raw,
    Rebill_value     AS Refund_weight,
    SS_Users,
    Single_Sale_Value,
    '7K'             AS Cohort,
    'Regular'        AS Table_Type
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`
),

-- =====================================================
-- STEP 2: GROUP-LEVEL AGGREGATION
-- SUM all additive metrics; weighted refund components
-- =====================================================
group_base AS (
  SELECT
    Report_date,
    Billing_Cycle,
    Cohort,
    Table_Type,

    SUM(Subscription_users)                AS Grp_Subscriptions,
    SUM(Rebills_raw)                       AS Grp_Rebills,
    SUM(Value_weight)                      AS Grp_Value_Weight,
    SUM(Refund_ratio_raw * Refund_weight)  AS Grp_Refund_Numerator,
    SUM(Refund_weight)                     AS Grp_Refund_Denominator,
    SUM(SS_Users)                          AS Grp_SS_Users,
    SUM(Single_Sale_Value)                 AS Grp_Single_Sale_Value

  FROM unioned_product_data
  GROUP BY Report_date, Billing_Cycle, Cohort, Table_Type
),

-- =====================================================
-- STEP 3: DISTINCT REPORT DATES (for source-table joins)
-- =====================================================
report_dates AS (
  SELECT DISTINCT Report_date
  FROM group_base
),

-- =====================================================
-- STEP 4: GLOBAL LAST SPEND DATE
-- One global last_spend_date per Report_date (no product/country filter)
-- =====================================================
global_last_spend AS (
  SELECT
    rd.Report_date,
    MAX(ads.Date) AS last_spend_date
  FROM report_dates rd
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON ads.Date <= rd.Report_date
    AND ads.allocated_spend > 0
  GROUP BY rd.Report_date
),

-- =====================================================
-- STEP 5: RECENT SPEND (7-day window from global last_spend_date)
-- =====================================================
recent_spend_calc AS (
  SELECT
    gls.Report_date,
    COALESCE(SUM(ads.allocated_spend), 0) AS Recent_Spend
  FROM global_last_spend gls
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON ads.Date BETWEEN DATE_SUB(gls.last_spend_date, INTERVAL 6 DAY) AND gls.last_spend_date
  GROUP BY gls.Report_date
),

-- =====================================================
-- STEP 6: RECENT USERS (7-day window, same window as Recent Spend)
-- COUNT DISTINCT, NT→BC1 / non-NT→BC0, no product/country filter
-- =====================================================
recent_users_calc AS (
  SELECT
    gls.Report_date,
    COUNT(DISTINCT base.Updated_Cust_ID) AS Recent_Users
  FROM global_last_spend gls
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON base.Date_of_Sale BETWEEN DATE_SUB(gls.last_spend_date, INTERVAL 6 DAY) AND gls.last_spend_date
    AND base.Trial_Type IS NOT NULL
    AND base.Trial_Type != 'SS'
    AND (
      (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
      OR (base.Trial_Type != 'NT' AND base.Billing_Cycle_Updated = 0)
    )
  GROUP BY gls.Report_date
),

-- =====================================================
-- STEP 7: T30D NEW USERS (30-day window, no product/country filter)
-- =====================================================
t30d_calc AS (
  SELECT
    rd.Report_date,
    COUNT(DISTINCT base.Updated_Cust_ID) AS T30D_New_Users
  FROM report_dates rd
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON base.Date_of_Sale BETWEEN DATE_SUB(rd.Report_date, INTERVAL 29 DAY) AND rd.Report_date
    AND base.Trial_Type IS NOT NULL
    AND base.Trial_Type != 'SS'
    AND (
      (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
      OR (base.Trial_Type != 'NT' AND base.Billing_Cycle_Updated = 0)
    )
  GROUP BY rd.Report_date
),

-- =====================================================
-- STEP 8: DAILY ALLOCATED SPEND (exact date, no filter)
-- =====================================================
daily_spend_calc AS (
  SELECT
    rd.Report_date,
    COALESCE(SUM(ads.allocated_spend), 0) AS Daily_Allocated_Spend
  FROM report_dates rd
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON ads.Date = rd.Report_date
  GROUP BY rd.Report_date
),

-- =====================================================
-- STEP 9: DAILY NEW USERS (exact date, no product/country filter)
-- =====================================================
daily_new_users_calc AS (
  SELECT
    rd.Report_date,
    COUNT(DISTINCT base.Updated_Cust_ID) AS Daily_New_Users
  FROM report_dates rd
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON base.Date_of_Sale = rd.Report_date
    AND base.Trial_Type IS NOT NULL
    AND base.Trial_Type != 'SS'
    AND (
      (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
      OR (base.Trial_Type != 'NT' AND base.Billing_Cycle_Updated = 0)
    )
  GROUP BY rd.Report_date
),

-- =====================================================
-- STEP 10: DAILY SS USERS (exact date, SS product filter)
-- =====================================================
daily_ss_users_calc AS (
  SELECT
    rd.Report_date,
    COUNT(DISTINCT base.Updated_Cust_ID) AS Daily_SS_Users
  FROM report_dates rd
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON base.Date_of_Sale = rd.Report_date
    AND RIGHT(base.Product_name_Final, 2) = 'SS'
    AND base.Billing_Cycle_Updated = 0
  GROUP BY rd.Report_date
),

-- =====================================================
-- STEP 11: T7D DAILY SS USERS (trailing 7-day avg of per-day distinct counts)
-- =====================================================
t7d_daily_ss_calc AS (
  SELECT
    Report_date,
    SUM(daily_count) / 7.0 AS T7D_Daily_SS_Users
  FROM (
    SELECT
      rd.Report_date,
      day_date,
      COUNT(DISTINCT base.Updated_Cust_ID) AS daily_count
    FROM report_dates rd
    CROSS JOIN UNNEST(
      GENERATE_DATE_ARRAY(DATE_SUB(rd.Report_date, INTERVAL 6 DAY), rd.Report_date)
    ) AS day_date
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
      ON base.Date_of_Sale = day_date
      AND RIGHT(base.Product_name_Final, 2) = 'SS'
      AND base.Billing_Cycle_Updated = 0
    GROUP BY rd.Report_date, day_date
  )
  GROUP BY Report_date
),

-- =====================================================
-- STEP 12: COMPUTE GROUP METRICS (Churn, Refund, First_Null_BC)
-- =====================================================
group_metrics AS (
  SELECT
    gb.*,

    -- Weighted average refund rate
    COALESCE(
      SAFE_DIVIDE(gb.Grp_Refund_Numerator, NULLIF(gb.Grp_Refund_Denominator, 0)),
      0
    ) AS Grp_Refund_Rate,

    -- Churn rate: BC0=0, BC1+ = 1 - Rebills/Subscriptions
    CASE
      WHEN gb.Billing_Cycle = 0 THEN 0.0
      ELSE 1 - COALESCE(SAFE_DIVIDE(gb.Grp_Rebills, NULLIF(gb.Grp_Subscriptions, 0)), 0)
    END AS Grp_Churn_Rate,

    -- First BC >= 1 where Rebills < 25 (triggers NULL cascade forward)
    MIN(CASE
      WHEN gb.Billing_Cycle >= 1
        AND (gb.Grp_Rebills IS NULL OR gb.Grp_Rebills < 25)
      THEN gb.Billing_Cycle
      ELSE NULL
    END) OVER (
      PARTITION BY gb.Report_date, gb.Cohort, gb.Table_Type
    ) AS First_Null_BC

  FROM group_base gb
),

-- =====================================================
-- STEP 13: RETENTION VIA CUMULATIVE PRODUCT
-- BC0 = 1.0; BC1+ = cumulative product of (1 - churn)
-- NULL from First_Null_BC onward
-- =====================================================
group_retention AS (
  SELECT
    gm.*,

    CASE
      WHEN gm.First_Null_BC IS NOT NULL AND gm.Billing_Cycle >= gm.First_Null_BC
        THEN NULL
      ELSE
        EXP(
          SUM(
            CASE
              WHEN gm.Billing_Cycle = 0 THEN 0.0
              ELSE LN(GREATEST(1 - gm.Grp_Churn_Rate, 1e-15))
            END
          ) OVER (
            PARTITION BY gm.Report_date, gm.Cohort, gm.Table_Type
            ORDER BY gm.Billing_Cycle
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
          )
        )
    END AS Grp_Retention

  FROM group_metrics gm
),

-- =====================================================
-- STEP 14: PER-BC ARPU CALCULATIONS + CASCADED REFUND
-- =====================================================
group_arpu AS (
  SELECT
    gr.*,

    -- Cascaded Refund Rate (NULL from First_Null_BC onward)
    CASE
      WHEN gr.First_Null_BC IS NOT NULL AND gr.Billing_Cycle >= gr.First_Null_BC THEN NULL
      ELSE gr.Grp_Refund_Rate
    END AS Cascaded_Refund_Rate,

    -- Cascaded Churn Rate (NULL from First_Null_BC onward)
    CASE
      WHEN gr.First_Null_BC IS NOT NULL AND gr.Billing_Cycle >= gr.First_Null_BC THEN NULL
      ELSE gr.Grp_Churn_Rate
    END AS Cascaded_Churn_Rate,

    -- Per-BC Gross ARPU Discounted (NULL when Retention is NULL)
    CASE
      WHEN gr.Grp_Retention IS NULL THEN NULL
      ELSE
        COALESCE(
          SAFE_DIVIDE(gr.Grp_Value_Weight, NULLIF(gr.Grp_Rebills, 0)) * gr.Grp_Retention,
          0.0
        )
        + COALESCE(
          SAFE_DIVIDE(gr.Grp_Single_Sale_Value, NULLIF(gr.Grp_Subscriptions, 0)),
          0.0
        )
    END AS Per_BC_Gross_ARPU,

    -- Per-BC Net ARPU Discounted (NULL when Retention is NULL)
    CASE
      WHEN gr.Grp_Retention IS NULL THEN NULL
      ELSE
        COALESCE(
          SAFE_DIVIDE(gr.Grp_Value_Weight, NULLIF(gr.Grp_Rebills, 0))
            * (gr.Grp_Retention - gr.Grp_Refund_Rate),
          0.0
        )
        + COALESCE(
          SAFE_DIVIDE(gr.Grp_Single_Sale_Value, NULLIF(gr.Grp_Subscriptions, 0)),
          0.0
        )
    END AS Per_BC_Net_ARPU

  FROM group_retention gr
),

-- =====================================================
-- STEP 15: CUMULATIVE METRICS (ARPU, Refund)
-- SUM window ignores NULLs; NULL cascade applied in final SELECT
-- =====================================================
cumulative_calcs AS (
  SELECT
    ga.*,

    -- Cumulative Gross ARPU Discounted
    SUM(ga.Per_BC_Gross_ARPU) OVER (
      PARTITION BY ga.Report_date, ga.Cohort, ga.Table_Type
      ORDER BY ga.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Cum_Gross_ARPU,

    -- Cumulative Net ARPU Discounted
    SUM(ga.Per_BC_Net_ARPU) OVER (
      PARTITION BY ga.Report_date, ga.Cohort, ga.Table_Type
      ORDER BY ga.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Cum_Net_ARPU,

    -- Cumulative Refund Rate (uses cascaded version so NULLs stop accumulation)
    SUM(ga.Cascaded_Refund_Rate) OVER (
      PARTITION BY ga.Report_date, ga.Cohort, ga.Table_Type
      ORDER BY ga.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Cum_Refund_Rate

  FROM group_arpu ga
),

-- =====================================================
-- STEP 16: BROADCAST & JOIN ALL DATE-LEVEL METRICS
-- Single_Sale, BC4_CAC_Ceiling, Recent/Daily metrics
-- =====================================================
broadcast_join AS (
  SELECT
    cc.*,

    -- Single Sale: BC0 priority, fallback BC1, broadcast to all BCs
    COALESCE(
      NULLIF(
        MAX(CASE WHEN cc.Billing_Cycle = 0 THEN cc.Grp_SS_Users ELSE NULL END)
          OVER (PARTITION BY cc.Report_date, cc.Cohort, cc.Table_Type),
        0
      ),
      NULLIF(
        MAX(CASE WHEN cc.Billing_Cycle = 1 THEN cc.Grp_SS_Users ELSE NULL END)
          OVER (PARTITION BY cc.Report_date, cc.Cohort, cc.Table_Type),
        0
      )
    ) AS Single_Sale_Broadcasted,

    -- BC4 CAC Ceiling (Net_ARPU cumulative at BC=4 minus 1.2)
    MAX(CASE WHEN cc.Billing_Cycle = 4 THEN cc.Cum_Net_ARPU ELSE NULL END)
      OVER (PARTITION BY cc.Report_date, cc.Cohort, cc.Table_Type) - 1.2
      AS BC4_CAC_Ceiling_raw,

    -- Date-level metrics (same for all BCs/Cohort/Table)
    COALESCE(rsc.Recent_Spend, 0)          AS Recent_Spend,
    COALESCE(ruc.Recent_Users, 0)          AS Recent_Users,
    COALESCE(t30.T30D_New_Users, 0)        AS T30D_New_Users,
    COALESCE(dsc.Daily_Allocated_Spend, 0) AS Daily_Allocated_Spend,
    COALESCE(dnu.Daily_New_Users, 0)       AS Daily_New_Users,
    COALESCE(dss.Daily_SS_Users, 0)        AS Daily_SS_Users,
    t7dss.T7D_Daily_SS_Users              AS T7D_Daily_SS_Users

  FROM cumulative_calcs cc
  LEFT JOIN recent_spend_calc rsc     ON cc.Report_date = rsc.Report_date
  LEFT JOIN recent_users_calc ruc     ON cc.Report_date = ruc.Report_date
  LEFT JOIN t30d_calc t30             ON cc.Report_date = t30.Report_date
  LEFT JOIN daily_spend_calc dsc      ON cc.Report_date = dsc.Report_date
  LEFT JOIN daily_new_users_calc dnu  ON cc.Report_date = dnu.Report_date
  LEFT JOIN daily_ss_users_calc dss   ON cc.Report_date = dss.Report_date
  LEFT JOIN t7d_daily_ss_calc t7dss   ON cc.Report_date = t7dss.Report_date
)

-- =====================================================
-- FINAL OUTPUT: 24 COLUMNS
-- =====================================================
SELECT
  -- Dimensions (4)
  bj.Report_date                     AS Reporting_Date,
  bj.Billing_Cycle                   AS BC,

  -- User Metrics (3)
  bj.Grp_Subscriptions               AS Subscriptions,
  bj.Grp_Rebills                     AS Rebills,
  bj.Single_Sale_Broadcasted         AS Single_Sale,

  -- Performance Ratios — WITH NULL CASCADE (5)
  bj.Cascaded_Churn_Rate             AS Churn_Rate,

  bj.Cascaded_Refund_Rate            AS Refund_Rate,

  CASE
    WHEN bj.First_Null_BC IS NOT NULL AND bj.Billing_Cycle >= bj.First_Null_BC THEN NULL
    ELSE bj.Cum_Refund_Rate
  END                                 AS Cumulative_Refund_Rate,

  bj.Grp_Retention                   AS Gross_ARPU_Retention_Rate,

  CASE
    WHEN bj.Grp_Retention IS NULL THEN NULL
    ELSE bj.Grp_Retention - bj.Grp_Refund_Rate
  END                                 AS Net_ARPU_Retention_Rate,

  -- CAC & Users — BROADCAST (3)
  CASE
    WHEN COALESCE(bj.Recent_Users, 0) = 0 THEN NULL
    ELSE NULLIF(SAFE_DIVIDE(bj.Recent_Spend, bj.Recent_Users), 0)
  END                                 AS Recent_CAC,

  bj.T30D_New_Users                  AS T30D_New_Users,

  -- Daily Metrics (5)
  bj.Daily_Allocated_Spend           AS Daily_Allocated_Spend,
  bj.Daily_New_Users                 AS Daily_New_Users,
  bj.Daily_SS_Users                  AS Daily_SS_Users,
  bj.T7D_Daily_SS_Users             AS T7D_Daily_SS_Users,

  -- T7D New Users = Recent_Users / 7
  SAFE_DIVIDE(bj.Recent_Users, 7)    AS T7D_New_Users,

  -- Daily CAC
  CASE
    WHEN COALESCE(bj.Daily_New_Users, 0) = 0 THEN NULL
    ELSE NULLIF(SAFE_DIVIDE(bj.Daily_Allocated_Spend, bj.Daily_New_Users), 0)
  END                                 AS Daily_CAC,

  -- Cumulative ARPU/LTV — WITH NULL CASCADE (3)
  CASE
    WHEN bj.First_Null_BC IS NOT NULL AND bj.Billing_Cycle >= bj.First_Null_BC THEN NULL
    ELSE NULLIF(bj.Cum_Gross_ARPU, 0)
  END                                 AS Gross_ARPU_Discounted,

  CASE
    WHEN bj.First_Null_BC IS NOT NULL AND bj.Billing_Cycle >= bj.First_Null_BC THEN NULL
    ELSE NULLIF(bj.Cum_Net_ARPU, 0)
  END                                 AS Net_ARPU_Discounted,

  CASE
    WHEN bj.First_Null_BC IS NOT NULL AND bj.Billing_Cycle >= bj.First_Null_BC THEN NULL
    ELSE NULLIF(bj.Cum_Net_ARPU, 0)
      - CASE
          WHEN COALESCE(bj.Recent_Users, 0) = 0 THEN 0
          ELSE COALESCE(SAFE_DIVIDE(bj.Recent_Spend, bj.Recent_Users), 0)
        END
  END                                 AS Net_LTV_Discounted,

  -- BC4 CAC Ceiling — EXCLUDED FROM NULL CASCADE (1)
  CASE
    WHEN (bj.Grp_Subscriptions IS NULL OR bj.Grp_Subscriptions = 0)
     AND (bj.Grp_Rebills IS NULL OR bj.Grp_Rebills = 0)
    THEN NULL
    ELSE NULLIF(bj.BC4_CAC_Ceiling_raw, 0)
  END                                 AS BC4_CAC_Ceiling,

  -- Identifiers (2)
  bj.Cohort                          AS Cohort,
  bj.Table_Type                      AS `Table`

FROM broadcast_join bj

ORDER BY
  Reporting_Date DESC,
  Cohort,
  `Table`,
  BC;

-- =====================================================
-- SCRIPT COMPLETE - GROUP LEVEL FINAL TABLE
-- Table: variant-finance-data-project.ICARUS_Multi.Final_Table_Group_Level
--
-- GRAIN: Report_date × Billing_Cycle × Cohort × Table_Type
--
-- SOURCES:
--   1. 7K_30D_Crystal_Ball (Cohort=7K_30D, Table=Crystal Ball)
--   2. 7K_Crystal_Ball     (Cohort=7K,     Table=Crystal Ball)
--   3. 7K_30D_Main_Table   (Cohort=7K_30D, Table=Regular)
--   4. 7K_Main_Table       (Cohort=7K,     Table=Regular)
--   5. Merged_Spend_Split_TBL (Daily & Recent Spend)
--   6. Sticky_data_API_original_V_Merged_TBL (Users, SS)
--
-- KEY DESIGN DECISIONS:
--   - No App_Name, Country_Code, Active_Inactive (group grain)
--   - Subscriptions, Rebills: simple SUM from product-level tables
--   - Refund_Rate: weighted avg (CB_Value or Rebill_value as weight)
--   - Retention: cumulative product of (1-churn) via EXP(SUM(LN))
--   - NULL cascade: Rebills < 25 at BC>=1 → NULL forward
--   - Recent_CAC: ONE global last_spend_date, 7-day window
--   - T30D/Daily: recomputed from source, no product/country filter
--   - T7D_Daily_SS: per-day COUNT DISTINCT averaged over 7 days
--   - ARPU: (Value_weight/Rebills) × Retention + SS_Value/Subs, cumulated
--   - Net_LTV: Cumulative Net_ARPU − Recent_CAC
--   - BC4_CAC_Ceiling excluded from NULL cascade
--
-- OUTPUT: 24 columns
-- =====================================================
