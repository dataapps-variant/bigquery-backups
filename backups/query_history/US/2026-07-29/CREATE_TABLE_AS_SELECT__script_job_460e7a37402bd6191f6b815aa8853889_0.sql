-- job_id: script_job_460e7a37402bd6191f6b815aa8853889_0
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T09:06:51.292000+00:00
-- started: 2026-07-29T09:06:51.924000+00:00
-- ended: 2026-07-29T09:07:01.726000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Cohort.Final_Table_App_AFID` AS

WITH
-- =====================================================
-- STEP 1: UNION ALL 4 SOURCE TABLES
-- =====================================================
unioned_data AS (
  SELECT Report_date, App_Name, Country_Code, AFID_Suffix, Billing_Cycle,
    Subscription_users, CB_User AS Rebills_raw, SS_Users,
    Churn_rate, Refund_ratio, Retention_rate, NET_Retention_rate,
    Recent_CAC, T30D_New_Users, Recent_Users,
    ARPU_Discounted, Net_ARPU_Discounted, Net_LTV_Discounted,
    Active_Inactive, '7K_30D' AS Cohort, 'Crystal Ball' AS Table_Type
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball_App_AFID`

  UNION ALL

  SELECT Report_date, App_Name, Country_Code, AFID_Suffix, Billing_Cycle,
    Subscription_users, CB_User AS Rebills_raw, SS_Users,
    Churn_rate, Refund_ratio, Retention_rate, NET_Retention_rate,
    Recent_CAC, T30D_New_Users, Recent_Users,
    ARPU_Discounted, Net_ARPU_Discounted, Net_LTV_Discounted,
    Active_Inactive, '7K' AS Cohort, 'Crystal Ball' AS Table_Type
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball_App_AFID`

  UNION ALL

  SELECT Report_date, App_Name, Country_Code, AFID_Suffix, Billing_Cycle,
    Subscription_users, Rebill_users AS Rebills_raw, SS_Users,
    Churn_rate, Refund_ratio, Retention_rate, NET_Retention_rate,
    Recent_CAC, T30D_New_Users, Recent_Users,
    ARPU_Discounted, Net_ARPU_Discounted, Net_LTV_Discounted,
    Active_Inactive, '7K_30D' AS Cohort, 'Regular' AS Table_Type
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table_App_AFID`

  UNION ALL

  SELECT Report_date, App_Name, Country_Code, AFID_Suffix, Billing_Cycle,
    Subscription_users, Rebill_users AS Rebills_raw, SS_Users,
    Churn_rate, Refund_ratio, Retention_rate, NET_Retention_rate,
    Recent_CAC, T30D_New_Users, Recent_Users,
    ARPU_Discounted, Net_ARPU_Discounted, Net_LTV_Discounted,
    Active_Inactive, '7K' AS Cohort, 'Regular' AS Table_Type
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table_App_AFID`
),

-- =====================================================
-- STEP 2: DAILY ALLOCATED SPEND
-- =====================================================
daily_spend_calc AS (
  SELECT 
    ud.Report_date, ud.App_Name, ud.Country_Code, ud.AFID_Suffix,
    COALESCE(SUM(
      CASE 
        WHEN ud.Country_Code = 'JP' AND ads.Country = 'JP' THEN ads.allocated_spend
        WHEN ud.Country_Code = 'Non-JP' AND (ads.Country != 'JP' OR ads.Country IS NULL) THEN ads.allocated_spend
        WHEN ud.Country_Code IS NULL OR ud.Country_Code = '' THEN ads.allocated_spend
        ELSE 0
      END
    ), 0) AS Daily_Allocated_Spend
  FROM (
    SELECT DISTINCT Report_date, App_Name, Country_Code, AFID_Suffix
    FROM unioned_data
  ) ud
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON ud.App_Name = ads.App_Name
    AND (
      (ud.AFID_Suffix IS NULL AND ads.Final_URL_suffix_AFID IS NULL)
      OR ud.AFID_Suffix = ads.Final_URL_suffix_AFID
    )
    AND ads.Date = ud.Report_date
  GROUP BY ud.Report_date, ud.App_Name, ud.Country_Code, ud.AFID_Suffix
),

-- =====================================================
-- STEP 3: DAILY NEW USERS
-- =====================================================
daily_new_users_calc AS (
  SELECT 
    ud.Report_date, ud.App_Name, ud.Country_Code, ud.AFID_Suffix,
    COUNT(DISTINCT base.Updated_Cust_ID) AS Daily_New_Users
  FROM (
    SELECT DISTINCT Report_date, App_Name, Country_Code, AFID_Suffix
    FROM unioned_data
  ) ud
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON LEFT(base.App_Name, 2) = LEFT(ud.App_Name, 2)
    AND (
      (ud.AFID_Suffix IS NULL AND base.AFID IS NULL)
      OR ud.AFID_Suffix = base.AFID
    )
    AND base.Date_of_Sale = ud.Report_date
    AND base.Trial_Type IS NOT NULL
    AND base.Trial_Type != 'SS'
    AND (
      (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
      OR (base.Trial_Type != 'NT' AND base.Billing_Cycle_Updated = 0)
    )
    AND (
      (LEFT(ud.App_Name, 2) = 'CT' AND ud.App_Name NOT LIKE '%Non-JP%' 
        AND ud.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(ud.App_Name, 2) = 'CT' AND ud.App_Name LIKE '%Non-JP%' 
        AND ud.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
      OR
      (LEFT(ud.App_Name, 2) != 'CT' AND ud.Country_Code = 'JP' 
        AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(ud.App_Name, 2) != 'CT' AND ud.Country_Code = 'Non-JP' 
        AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR
      (ud.Country_Code IS NULL OR ud.Country_Code = '')
    )
  GROUP BY ud.Report_date, ud.App_Name, ud.Country_Code, ud.AFID_Suffix
),

-- =====================================================
-- STEP 3b: DAILY SS USERS
-- =====================================================
daily_ss_users_calc AS (
  SELECT 
    ud.Report_date, ud.App_Name, ud.Country_Code, ud.AFID_Suffix,
    COUNT(DISTINCT base.Updated_Cust_ID) AS Daily_SS_Users
  FROM (
    SELECT DISTINCT Report_date, App_Name, Country_Code, AFID_Suffix
    FROM unioned_data
  ) ud
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON LEFT(base.App_Name, 2) = LEFT(ud.App_Name, 2)
    AND (
      (ud.AFID_Suffix IS NULL AND base.AFID IS NULL)
      OR ud.AFID_Suffix = base.AFID
    )
    AND base.Date_of_Sale = ud.Report_date
    AND RIGHT(base.Product_name_Final, 2) = 'SS'
    AND base.Billing_Cycle_Updated = 0
    AND (
      (LEFT(ud.App_Name, 2) = 'CT' AND ud.App_Name NOT LIKE '%Non-JP%' 
        AND ud.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(ud.App_Name, 2) = 'CT' AND ud.App_Name LIKE '%Non-JP%' 
        AND ud.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
      OR
      (LEFT(ud.App_Name, 2) != 'CT' AND ud.Country_Code = 'JP' 
        AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(ud.App_Name, 2) != 'CT' AND ud.Country_Code = 'Non-JP' 
        AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR
      (ud.Country_Code IS NULL OR ud.Country_Code = '')
    )
  GROUP BY ud.Report_date, ud.App_Name, ud.Country_Code, ud.AFID_Suffix
),

-- =====================================================
-- STEP 3c: T7D DAILY SS USERS
-- =====================================================
t7d_daily_ss_users_calc AS (
  SELECT 
    Report_date, App_Name, Country_Code, AFID_Suffix,
    SUM(daily_distinct_count) / 7.0 AS T7D_Daily_SS_Users
  FROM (
    SELECT 
      ud.Report_date, ud.App_Name, ud.Country_Code, ud.AFID_Suffix, day_date,
      COUNT(DISTINCT base.Updated_Cust_ID) AS daily_distinct_count
    FROM (
      SELECT DISTINCT Report_date, App_Name, Country_Code, AFID_Suffix
      FROM unioned_data
    ) ud
    CROSS JOIN UNNEST(
      GENERATE_DATE_ARRAY(DATE_SUB(ud.Report_date, INTERVAL 6 DAY), ud.Report_date)
    ) AS day_date
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
      ON LEFT(base.App_Name, 2) = LEFT(ud.App_Name, 2)
      AND (
        (ud.AFID_Suffix IS NULL AND base.AFID IS NULL)
        OR ud.AFID_Suffix = base.AFID
      )
      AND base.Date_of_Sale = day_date
      AND RIGHT(base.Product_name_Final, 2) = 'SS'
      AND base.Billing_Cycle_Updated = 0
      AND (
        (LEFT(ud.App_Name, 2) = 'CT' AND ud.App_Name NOT LIKE '%Non-JP%' 
          AND ud.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
        OR
        (LEFT(ud.App_Name, 2) = 'CT' AND ud.App_Name LIKE '%Non-JP%' 
          AND ud.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
        OR
        (LEFT(ud.App_Name, 2) != 'CT' AND ud.Country_Code = 'JP' 
          AND base.Spend_Country_Code_AFID = 'JP')
        OR
        (LEFT(ud.App_Name, 2) != 'CT' AND ud.Country_Code = 'Non-JP' 
          AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
        OR
        (ud.Country_Code IS NULL OR ud.Country_Code = '')
      )
    GROUP BY ud.Report_date, ud.App_Name, ud.Country_Code, ud.AFID_Suffix, day_date
  )
  GROUP BY Report_date, App_Name, Country_Code, AFID_Suffix
),

-- =====================================================
-- STEP 4: CUMULATIVE METRICS
-- =====================================================
cumulative_metrics AS (
  SELECT 
    ud.*,

    SUM(ud.Refund_ratio) OVER (
      PARTITION BY ud.App_Name, ud.Country_Code, ud.AFID_Suffix, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Cumulative_Refund_Rate,

    SUM(ud.ARPU_Discounted) OVER (
      PARTITION BY ud.App_Name, ud.Country_Code, ud.AFID_Suffix, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Gross_ARPU_Discounted,

    SUM(ud.Net_ARPU_Discounted) OVER (
      PARTITION BY ud.App_Name, ud.Country_Code, ud.AFID_Suffix, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Net_ARPU_Discounted_Cumulative,

    SUM(ud.Net_LTV_Discounted) OVER (
      PARTITION BY ud.App_Name, ud.Country_Code, ud.AFID_Suffix, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Net_LTV_Discounted_Cumulative

  FROM unioned_data ud
),

-- =====================================================
-- STEP 5: BROADCAST + JOIN DAILY METRICS
-- =====================================================
broadcast_and_join AS (
  SELECT 
    cm.*,

    MAX(CASE WHEN cm.Billing_Cycle = 0 THEN cm.Recent_CAC ELSE NULL END) OVER (
      PARTITION BY cm.App_Name, cm.Country_Code, cm.AFID_Suffix, cm.Report_date, cm.Cohort, cm.Table_Type
    ) AS Recent_CAC_Broadcasted,

    MAX(CASE WHEN cm.Billing_Cycle = 0 THEN cm.T30D_New_Users ELSE NULL END) OVER (
      PARTITION BY cm.App_Name, cm.Country_Code, cm.AFID_Suffix, cm.Report_date, cm.Cohort, cm.Table_Type
    ) AS T30D_New_Users_Broadcasted,

    MAX(CASE WHEN cm.Billing_Cycle = 0 THEN cm.Recent_Users ELSE NULL END) OVER (
      PARTITION BY cm.App_Name, cm.Country_Code, cm.AFID_Suffix, cm.Report_date, cm.Cohort, cm.Table_Type
    ) AS Recent_Users_Broadcasted,

    COALESCE(
      NULLIF(
        MAX(CASE WHEN cm.Billing_Cycle = 0 THEN cm.SS_Users ELSE NULL END) 
          OVER (PARTITION BY cm.App_Name, cm.Country_Code, cm.AFID_Suffix, cm.Report_date, cm.Cohort, cm.Table_Type),
        0
      ),
      NULLIF(
        MAX(CASE WHEN cm.Billing_Cycle = 1 THEN cm.SS_Users ELSE NULL END) 
          OVER (PARTITION BY cm.App_Name, cm.Country_Code, cm.AFID_Suffix, cm.Report_date, cm.Cohort, cm.Table_Type),
        0
      )
    ) AS Single_Sale_Broadcasted,

    COALESCE(dsc.Daily_Allocated_Spend, 0) AS Daily_Allocated_Spend,
    COALESCE(dnu.Daily_New_Users, 0) AS Daily_New_Users,
    dss.Daily_SS_Users,
    t7dss.T7D_Daily_SS_Users

  FROM cumulative_metrics cm
  LEFT JOIN daily_spend_calc dsc
    ON cm.Report_date = dsc.Report_date AND cm.App_Name = dsc.App_Name
    AND ((cm.Country_Code IS NULL AND dsc.Country_Code IS NULL) OR cm.Country_Code = dsc.Country_Code)
    AND ((cm.AFID_Suffix IS NULL AND dsc.AFID_Suffix IS NULL) OR cm.AFID_Suffix = dsc.AFID_Suffix)
  LEFT JOIN daily_new_users_calc dnu
    ON cm.Report_date = dnu.Report_date AND cm.App_Name = dnu.App_Name
    AND ((cm.Country_Code IS NULL AND dnu.Country_Code IS NULL) OR cm.Country_Code = dnu.Country_Code)
    AND ((cm.AFID_Suffix IS NULL AND dnu.AFID_Suffix IS NULL) OR cm.AFID_Suffix = dnu.AFID_Suffix)
  LEFT JOIN daily_ss_users_calc dss
    ON cm.Report_date = dss.Report_date AND cm.App_Name = dss.App_Name
    AND ((cm.Country_Code IS NULL AND dss.Country_Code IS NULL) OR cm.Country_Code = dss.Country_Code)
    AND ((cm.AFID_Suffix IS NULL AND dss.AFID_Suffix IS NULL) OR cm.AFID_Suffix = dss.AFID_Suffix)
  LEFT JOIN t7d_daily_ss_users_calc t7dss
    ON cm.Report_date = t7dss.Report_date AND cm.App_Name = t7dss.App_Name
    AND ((cm.Country_Code IS NULL AND t7dss.Country_Code IS NULL) OR cm.Country_Code = t7dss.Country_Code)
    AND ((cm.AFID_Suffix IS NULL AND t7dss.AFID_Suffix IS NULL) OR cm.AFID_Suffix = t7dss.AFID_Suffix)
),

-- =====================================================
-- STEP 6: BC4_CAC_CEILING
-- =====================================================
bc4_ceiling_calc AS (
  SELECT 
    bj.*,
    MAX(CASE WHEN bj.Billing_Cycle = 4 THEN bj.Net_ARPU_Discounted_Cumulative ELSE NULL END) 
      OVER (PARTITION BY bj.App_Name, bj.Country_Code, bj.AFID_Suffix, bj.Report_date, bj.Cohort, bj.Table_Type) - 1.2 
      AS BC4_CAC_Ceiling
  FROM broadcast_and_join bj
),

-- =====================================================
-- STEP 7: FIRST NULL BC DETECTION
-- BC0 never triggers, BC1+ Rebills < 25 → NULL cascade
-- =====================================================
first_null_detection AS (
  SELECT 
    bcc.*,
    MIN(CASE 
      WHEN bcc.Billing_Cycle = 0 THEN NULL
      WHEN bcc.Billing_Cycle >= 1 
        AND (bcc.Rebills_raw IS NULL OR bcc.Rebills_raw < 25)
      THEN bcc.Billing_Cycle
      ELSE NULL
    END) OVER (
      PARTITION BY bcc.App_Name, bcc.Country_Code, bcc.AFID_Suffix, bcc.Report_date, bcc.Cohort, bcc.Table_Type
      ORDER BY bcc.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS First_Null_BC
  FROM bc4_ceiling_calc bcc
)

-- =====================================================
-- FINAL OUTPUT: 28 COLUMNS
-- =====================================================
SELECT 
  -- Dimensions (6)
  Report_date AS Reporting_Date,
  Active_Inactive,
  Billing_Cycle AS BC,
  App_Name,
  Country_Code AS Country,
  AFID_Suffix,

  -- User Metrics (3)
  Subscription_users AS Subscriptions,
  Rebills_raw AS Rebills,
  Single_Sale_Broadcasted AS Single_Sale,

  -- Performance Ratios (5) — WITH CASCADE
  CASE WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Churn_rate END AS Churn_Rate,

  CASE WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Refund_ratio END AS Refund_Rate,

  CASE WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Cumulative_Refund_Rate END AS Cumulative_Refund_Rate,

  CASE WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE Retention_rate END AS Gross_ARPU_Retention_Rate,

  CASE WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE NET_Retention_rate END AS Net_ARPU_Retention_Rate,

  -- Broadcasted Metrics (2) — NOT cascaded
  NULLIF(Recent_CAC_Broadcasted, 0) AS Recent_CAC,
  T30D_New_Users_Broadcasted AS T30D_New_Users,

  -- Daily Metrics (5) — NOT cascaded
  Daily_Allocated_Spend,
  Daily_New_Users,
  Daily_SS_Users,
  T7D_Daily_SS_Users,
  CASE 
    WHEN COALESCE(Daily_New_Users, 0) = 0 THEN NULL
    ELSE NULLIF(SAFE_DIVIDE(Daily_Allocated_Spend, Daily_New_Users), 0)
  END AS Daily_CAC,

  -- T7D New Users — NOT cascaded
  SAFE_DIVIDE(Recent_Users_Broadcasted, 7) AS T7D_New_Users,

  -- Cumulative ARPU/LTV (3) — WITH CASCADE
  CASE WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE NULLIF(Gross_ARPU_Discounted, 0) END AS Gross_ARPU_Discounted,

  CASE WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    -- NEW
ELSE NULLIF(Net_ARPU_Discounted_Cumulative, 0) END AS Net_ARPU_Discounted,

  CASE WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
    ELSE NULLIF(Net_LTV_Discounted_Cumulative, 0) END AS Net_LTV_Discounted,

  -- BC4_CAC_Ceiling — EXCLUDED from cascade
  NULLIF(BC4_CAC_Ceiling, 0) AS BC4_CAC_Ceiling,

  -- Identifiers (2)
  Cohort,
  Table_Type AS Table

FROM first_null_detection

ORDER BY 
  Reporting_Date DESC,
  App_Name,
  Country,
  AFID_Suffix,
  Cohort,
  Table,
  BC
