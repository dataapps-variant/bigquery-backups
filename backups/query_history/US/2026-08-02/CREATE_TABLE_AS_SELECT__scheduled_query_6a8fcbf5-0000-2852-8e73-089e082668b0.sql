-- job_id: scheduled_query_6a8fcbf5-0000-2852-8e73-089e082668b0
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-02T09:30:02.669000+00:00
-- started: 2026-08-02T09:30:03.029000+00:00
-- ended: 2026-08-02T09:31:16.765000+00:00


CREATE OR REPLACE TABLE `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_Final_Table_App_Level` AS

WITH 
-- =====================================================
-- STEP 1: UNION ALL 4 SOURCE TABLES
-- =====================================================
unioned_data AS (
  SELECT 
    Report_date, App_Name, Country_Code, Spend_Country_Code_AFID, Billing_Cycle,
    Subscription_users, CB_User AS Rebills_raw, SS_Users,
    Churn_rate, Refund_ratio, Retention_rate, NET_Retention_rate,
    Recent_CAC, T30D_New_Users, Recent_Users,
    ARPU_Discounted, Net_ARPU_Discounted, Net_LTV_Discounted, Active_Inactive,
    '7K_30D' AS Cohort, 'Crystal Ball' AS Table_Type
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball_App_level`
  
  UNION ALL
  
  SELECT 
    Report_date, App_Name, Country_Code, Spend_Country_Code_AFID, Billing_Cycle,
    Subscription_users, CB_User AS Rebills_raw, SS_Users,
    Churn_rate, Refund_ratio, Retention_rate, NET_Retention_rate,
    Recent_CAC, T30D_New_Users, Recent_Users,
    ARPU_Discounted, Net_ARPU_Discounted, Net_LTV_Discounted, Active_Inactive,
    '7K' AS Cohort, 'Crystal Ball' AS Table_Type
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball_App_level`
  
  UNION ALL
  
  SELECT 
    Report_date, App_Name, Country_Code, Spend_Country_Code_AFID, Billing_Cycle,
    Subscription_users, Rebill_users AS Rebills_raw, SS_Users,
    Churn_rate, Refund_ratio, Retention_rate, NET_Retention_rate,
    Recent_CAC, T30D_New_Users, Recent_Users,
    ARPU_Discounted, Net_ARPU_Discounted, Net_LTV_Discounted, Active_Inactive,
    '7K_30D' AS Cohort, 'Regular' AS Table_Type
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table_App_level`
  
  UNION ALL
  
  SELECT 
    Report_date, App_Name, Country_Code, Spend_Country_Code_AFID, Billing_Cycle,
    Subscription_users, Rebill_users AS Rebills_raw, SS_Users,
    Churn_rate, Refund_ratio, Retention_rate, NET_Retention_rate,
    Recent_CAC, T30D_New_Users, Recent_Users,
    ARPU_Discounted, Net_ARPU_Discounted, Net_LTV_Discounted, Active_Inactive,
    '7K' AS Cohort, 'Regular' AS Table_Type
  FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_Main_Table_App_level`
),

-- =====================================================
-- STEP 2: CUMULATIVE METRICS
-- =====================================================
cumulative_metrics AS (
  SELECT 
    ud.*,
    SUM(ud.Refund_ratio) OVER (
      PARTITION BY ud.App_Name, ud.Country_Code, ud.Spend_Country_Code_AFID, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Cumulative_Refund_Rate,
    SUM(ud.ARPU_Discounted) OVER (
      PARTITION BY ud.App_Name, ud.Country_Code, ud.Spend_Country_Code_AFID, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Gross_ARPU_Discounted,
    SUM(ud.Net_ARPU_Discounted) OVER (
      PARTITION BY ud.App_Name, ud.Country_Code, ud.Spend_Country_Code_AFID, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Net_ARPU_Discounted_Cumulative,
    SUM(ud.Net_LTV_Discounted) OVER (
      PARTITION BY ud.App_Name, ud.Country_Code, ud.Spend_Country_Code_AFID, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Net_LTV_Discounted_Cumulative
  FROM unioned_data ud
),

-- =====================================================
-- STEP 3: BROADCAST BC0 METRICS
-- =====================================================
broadcast_metrics AS (
  SELECT 
    cm.*,
    MAX(CASE WHEN cm.Billing_Cycle = 0 THEN cm.Recent_CAC ELSE NULL END) OVER (
      PARTITION BY cm.App_Name, cm.Country_Code, cm.Spend_Country_Code_AFID, cm.Report_date, cm.Cohort, cm.Table_Type
    ) AS Recent_CAC_Broadcasted,
    MAX(CASE WHEN cm.Billing_Cycle = 0 THEN cm.T30D_New_Users ELSE NULL END) OVER (
      PARTITION BY cm.App_Name, cm.Country_Code, cm.Spend_Country_Code_AFID, cm.Report_date, cm.Cohort, cm.Table_Type
    ) AS T30D_New_Users_Broadcasted,
    MAX(CASE WHEN cm.Billing_Cycle = 0 THEN cm.Recent_Users ELSE NULL END) OVER (
      PARTITION BY cm.App_Name, cm.Country_Code, cm.Spend_Country_Code_AFID, cm.Report_date, cm.Cohort, cm.Table_Type
    ) AS Recent_Users_Broadcasted,
    COALESCE(
      NULLIF(MAX(CASE WHEN cm.Billing_Cycle = 0 THEN cm.SS_Users ELSE NULL END) 
        OVER (PARTITION BY cm.App_Name, cm.Country_Code, cm.Spend_Country_Code_AFID, cm.Report_date, cm.Cohort, cm.Table_Type), 0),
      NULLIF(MAX(CASE WHEN cm.Billing_Cycle = 1 THEN cm.SS_Users ELSE NULL END) 
        OVER (PARTITION BY cm.App_Name, cm.Country_Code, cm.Spend_Country_Code_AFID, cm.Report_date, cm.Cohort, cm.Table_Type), 0)
    ) AS Single_Sale_Broadcasted
  FROM cumulative_metrics cm
),

-- =====================================================
-- STEP 4: BC4_CAC_CEILING + BC4_Net_LTV
-- =====================================================
bc4_ceiling_calc AS (
  SELECT 
    bm.*,
    MAX(CASE WHEN bm.Billing_Cycle = 4 THEN bm.Net_ARPU_Discounted_Cumulative ELSE NULL END) 
      OVER (PARTITION BY bm.App_Name, bm.Country_Code, bm.Spend_Country_Code_AFID, bm.Report_date, bm.Cohort, bm.Table_Type) - 1.2 
      AS BC4_CAC_Ceiling,
    MAX(CASE WHEN bm.Billing_Cycle = 4 THEN bm.Net_LTV_Discounted_Cumulative ELSE NULL END) 
      OVER (PARTITION BY bm.App_Name, bm.Country_Code, bm.Spend_Country_Code_AFID, bm.Report_date, bm.Cohort, bm.Table_Type)
      AS BC4_Net_LTV_Discounted_Raw
  FROM broadcast_metrics bm
),

-- =====================================================
-- STEP 5: DAILY METRICS (recompute from raw source)
-- SCA change: ads.Country = SCA and base.Spend_Country_Code_AFID = SCA
-- =====================================================
daily_spend_calc AS (
  SELECT 
    bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.Spend_Country_Code_AFID,
    SUM(CASE 
      WHEN bcc.Country_Code = 'JP' AND ads.Country = 'JP' THEN ads.allocated_spend
      WHEN bcc.Country_Code = 'Non-JP' AND (ads.Country != 'JP' OR ads.Country IS NULL) THEN ads.allocated_spend
      WHEN bcc.Country_Code IS NULL OR bcc.Country_Code = '' THEN ads.allocated_spend
      ELSE 0
    END) AS Daily_Allocated_Spend
  FROM (SELECT DISTINCT Report_date, App_Name, Country_Code, Spend_Country_Code_AFID FROM bc4_ceiling_calc) bcc
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON bcc.App_Name = ads.App_Name
    AND ads.Country = bcc.Spend_Country_Code_AFID
    AND ads.Date = bcc.Report_date
  GROUP BY bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.Spend_Country_Code_AFID
),

daily_users_calc AS (
  SELECT 
    bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.Spend_Country_Code_AFID,
    COUNT(DISTINCT base.Updated_Cust_ID) AS Daily_New_Users
  FROM (SELECT DISTINCT Report_date, App_Name, Country_Code, Spend_Country_Code_AFID FROM bc4_ceiling_calc) bcc
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON LEFT(base.App_Name, 2) = LEFT(bcc.App_Name, 2)
    AND base.Spend_Country_Code_AFID = bcc.Spend_Country_Code_AFID
    AND base.Date_of_Sale = bcc.Report_date
    AND base.Trial_Type IS NOT NULL
    AND base.Trial_Type != 'SS'
    AND (
      (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
      OR (base.Trial_Type != 'NT' AND base.Billing_Cycle_Updated = 0)
    )
    AND (
      (LEFT(bcc.App_Name, 2) = 'CT' AND bcc.App_Name NOT LIKE '%Non-JP%' 
        AND bcc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(bcc.App_Name, 2) = 'CT' AND bcc.App_Name LIKE '%Non-JP%' 
        AND bcc.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
      OR
      (LEFT(bcc.App_Name, 2) != 'CT' AND bcc.Country_Code = 'JP' 
        AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(bcc.App_Name, 2) != 'CT' AND bcc.Country_Code = 'Non-JP' 
        AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR
      (bcc.Country_Code IS NULL OR bcc.Country_Code = '')
    )
  GROUP BY bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.Spend_Country_Code_AFID
),

recent_spend_calc AS (
  SELECT 
    bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.Spend_Country_Code_AFID,
    COALESCE(SUM(CASE 
      WHEN bcc.Country_Code = 'JP' AND ads.Country = 'JP' THEN ads.allocated_spend
      WHEN bcc.Country_Code = 'Non-JP' AND (ads.Country != 'JP' OR ads.Country IS NULL) THEN ads.allocated_spend
      WHEN bcc.Country_Code IS NULL OR bcc.Country_Code = '' THEN ads.allocated_spend
      ELSE 0
    END), 0) AS Recent_Spend
  FROM (SELECT DISTINCT Report_date, App_Name, Country_Code, Spend_Country_Code_AFID FROM bc4_ceiling_calc) bcc
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON bcc.App_Name = ads.App_Name
    AND ads.Country = bcc.Spend_Country_Code_AFID
    AND ads.Date BETWEEN DATE_SUB(bcc.Report_date, INTERVAL 6 DAY) AND bcc.Report_date
  GROUP BY bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.Spend_Country_Code_AFID
),

daily_ss_users_calc AS (
  SELECT 
    bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.Spend_Country_Code_AFID,
    COUNT(DISTINCT base.Updated_Cust_ID) AS Daily_SS_Users
  FROM (SELECT DISTINCT Report_date, App_Name, Country_Code, Spend_Country_Code_AFID FROM bc4_ceiling_calc) bcc
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON LEFT(base.App_Name, 2) = LEFT(bcc.App_Name, 2)
    AND base.Spend_Country_Code_AFID = bcc.Spend_Country_Code_AFID
    AND base.Date_of_Sale = bcc.Report_date
    AND RIGHT(base.Product_name_Final, 2) = 'SS'
    AND base.Billing_Cycle_Updated = 0
    AND (
      (LEFT(bcc.App_Name, 2) = 'CT' AND bcc.App_Name NOT LIKE '%Non-JP%' 
        AND bcc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(bcc.App_Name, 2) = 'CT' AND bcc.App_Name LIKE '%Non-JP%' 
        AND bcc.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
      OR
      (LEFT(bcc.App_Name, 2) != 'CT' AND bcc.Country_Code = 'JP' 
        AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(bcc.App_Name, 2) != 'CT' AND bcc.Country_Code = 'Non-JP' 
        AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR
      (bcc.Country_Code IS NULL OR bcc.Country_Code = '')
    )
  GROUP BY bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.Spend_Country_Code_AFID
),

t7d_users_ss_sum_calc AS (
  SELECT
    Report_date, App_Name, Country_Code, Spend_Country_Code_AFID,
    SUM(daily_new_count) + SUM(daily_ss_count) AS T7D_Users_SS_Sum
  FROM (
    SELECT
      bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.Spend_Country_Code_AFID, day_date,
      COUNT(DISTINCT CASE 
        WHEN base.Trial_Type IS NOT NULL
          AND base.Trial_Type != 'SS'
          AND (
            (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
            OR (base.Trial_Type != 'NT' AND base.Billing_Cycle_Updated = 0)
          )
        THEN base.Updated_Cust_ID 
      END) AS daily_new_count,
      COUNT(DISTINCT CASE 
        WHEN RIGHT(base.Product_name_Final, 2) = 'SS'
          AND base.Billing_Cycle_Updated = 0
        THEN base.Updated_Cust_ID 
      END) AS daily_ss_count
    FROM (SELECT DISTINCT Report_date, App_Name, Country_Code, Spend_Country_Code_AFID FROM bc4_ceiling_calc) bcc
    CROSS JOIN UNNEST(GENERATE_DATE_ARRAY(DATE_SUB(bcc.Report_date, INTERVAL 6 DAY), bcc.Report_date)) AS day_date
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
      ON LEFT(base.App_Name, 2) = LEFT(bcc.App_Name, 2)
      AND base.Spend_Country_Code_AFID = bcc.Spend_Country_Code_AFID
      AND base.Date_of_Sale = day_date
      AND (
        (LEFT(bcc.App_Name, 2) = 'CT' AND bcc.App_Name NOT LIKE '%Non-JP%'
          AND bcc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
        OR
        (LEFT(bcc.App_Name, 2) = 'CT' AND bcc.App_Name LIKE '%Non-JP%'
          AND bcc.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
        OR
        (LEFT(bcc.App_Name, 2) != 'CT' AND bcc.Country_Code = 'JP'
          AND base.Spend_Country_Code_AFID = 'JP')
        OR
        (LEFT(bcc.App_Name, 2) != 'CT' AND bcc.Country_Code = 'Non-JP'
          AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
        OR
        (bcc.Country_Code IS NULL OR bcc.Country_Code = '')
      )
    GROUP BY bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.Spend_Country_Code_AFID, day_date
  )
  GROUP BY Report_date, App_Name, Country_Code, Spend_Country_Code_AFID
),

t7d_daily_ss_users_calc AS (
  SELECT 
    Report_date, App_Name, Country_Code, Spend_Country_Code_AFID,
    SUM(daily_distinct_count) / 7.0 AS T7D_Daily_SS_Users
  FROM (
    SELECT 
      bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.Spend_Country_Code_AFID, day_date,
      COUNT(DISTINCT base.Updated_Cust_ID) AS daily_distinct_count
    FROM (SELECT DISTINCT Report_date, App_Name, Country_Code, Spend_Country_Code_AFID FROM bc4_ceiling_calc) bcc
    CROSS JOIN UNNEST(GENERATE_DATE_ARRAY(DATE_SUB(bcc.Report_date, INTERVAL 6 DAY), bcc.Report_date)) AS day_date
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
      ON LEFT(base.App_Name, 2) = LEFT(bcc.App_Name, 2)
      AND base.Spend_Country_Code_AFID = bcc.Spend_Country_Code_AFID
      AND base.Date_of_Sale = day_date
      AND RIGHT(base.Product_name_Final, 2) = 'SS'
      AND base.Billing_Cycle_Updated = 0
      AND (
        (LEFT(bcc.App_Name, 2) = 'CT' AND bcc.App_Name NOT LIKE '%Non-JP%' 
          AND bcc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
        OR
        (LEFT(bcc.App_Name, 2) = 'CT' AND bcc.App_Name LIKE '%Non-JP%' 
          AND bcc.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
        OR
        (LEFT(bcc.App_Name, 2) != 'CT' AND bcc.Country_Code = 'JP' 
          AND base.Spend_Country_Code_AFID = 'JP')
        OR
        (LEFT(bcc.App_Name, 2) != 'CT' AND bcc.Country_Code = 'Non-JP' 
          AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
        OR
        (bcc.Country_Code IS NULL OR bcc.Country_Code = '')
      )
    GROUP BY bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.Spend_Country_Code_AFID, day_date
  )
  GROUP BY Report_date, App_Name, Country_Code, Spend_Country_Code_AFID
),

t7d_new_users_calc AS (
  SELECT 
    Report_date, App_Name, Country_Code, Spend_Country_Code_AFID,
    SUM(daily_distinct_count) / 7.0 AS T7D_New_Users
  FROM (
    SELECT 
      bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.Spend_Country_Code_AFID, day_date,
      COUNT(DISTINCT base.Updated_Cust_ID) AS daily_distinct_count
    FROM (SELECT DISTINCT Report_date, App_Name, Country_Code, Spend_Country_Code_AFID FROM bc4_ceiling_calc) bcc
    CROSS JOIN UNNEST(GENERATE_DATE_ARRAY(DATE_SUB(bcc.Report_date, INTERVAL 6 DAY), bcc.Report_date)) AS day_date
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
      ON LEFT(base.App_Name, 2) = LEFT(bcc.App_Name, 2)
      AND base.Spend_Country_Code_AFID = bcc.Spend_Country_Code_AFID
      AND base.Date_of_Sale = day_date
      AND base.Trial_Type IS NOT NULL
      AND base.Trial_Type != 'SS'
      AND (
        (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
        OR (base.Trial_Type != 'NT' AND base.Billing_Cycle_Updated = 0)
      )
      AND (
        (LEFT(bcc.App_Name, 2) = 'CT' AND bcc.App_Name NOT LIKE '%Non-JP%' 
          AND bcc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
        OR
        (LEFT(bcc.App_Name, 2) = 'CT' AND bcc.App_Name LIKE '%Non-JP%' 
          AND bcc.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
        OR
        (LEFT(bcc.App_Name, 2) != 'CT' AND bcc.Country_Code = 'JP' 
          AND base.Spend_Country_Code_AFID = 'JP')
        OR
        (LEFT(bcc.App_Name, 2) != 'CT' AND bcc.Country_Code = 'Non-JP' 
          AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
        OR
        (bcc.Country_Code IS NULL OR bcc.Country_Code = '')
      )
    GROUP BY bcc.Report_date, bcc.App_Name, bcc.Country_Code, bcc.Spend_Country_Code_AFID, day_date
  )
  GROUP BY Report_date, App_Name, Country_Code, Spend_Country_Code_AFID
),

with_daily_metrics AS (
  SELECT 
    bcc.*,
    COALESCE(ds.Daily_Allocated_Spend, 0) AS Daily_Allocated_Spend,
    COALESCE(rs.Recent_Spend, 0) AS Recent_Spend,
    COALESCE(rs.Recent_Spend, 0) / 7.0 AS T7D_Spend,
    COALESCE(du.Daily_New_Users, 0) AS Daily_New_Users,
    dss.Daily_SS_Users,
    t7dss.T7D_Daily_SS_Users,
    t7dnu.T7D_New_Users,
    COALESCE(SAFE_DIVIDE(ds.Daily_Allocated_Spend, NULLIF(du.Daily_New_Users, 0)), 0) AS Daily_CAC,
    SAFE_DIVIDE(rs.Recent_Spend, NULLIF(tuss.T7D_Users_SS_Sum, 0)) AS T7D_CAC_SS
  FROM bc4_ceiling_calc bcc
  LEFT JOIN daily_spend_calc ds
    ON bcc.Report_date = ds.Report_date AND bcc.App_Name = ds.App_Name
    AND bcc.Country_Code = ds.Country_Code AND bcc.Spend_Country_Code_AFID = ds.Spend_Country_Code_AFID
  LEFT JOIN daily_users_calc du
    ON bcc.Report_date = du.Report_date AND bcc.App_Name = du.App_Name
    AND bcc.Country_Code = du.Country_Code AND bcc.Spend_Country_Code_AFID = du.Spend_Country_Code_AFID
  LEFT JOIN daily_ss_users_calc dss
    ON bcc.Report_date = dss.Report_date AND bcc.App_Name = dss.App_Name
    AND bcc.Country_Code = dss.Country_Code AND bcc.Spend_Country_Code_AFID = dss.Spend_Country_Code_AFID
  LEFT JOIN t7d_daily_ss_users_calc t7dss
    ON bcc.Report_date = t7dss.Report_date AND bcc.App_Name = t7dss.App_Name
    AND bcc.Country_Code = t7dss.Country_Code AND bcc.Spend_Country_Code_AFID = t7dss.Spend_Country_Code_AFID
  LEFT JOIN recent_spend_calc rs
    ON bcc.Report_date = rs.Report_date AND bcc.App_Name = rs.App_Name
    AND bcc.Country_Code = rs.Country_Code AND bcc.Spend_Country_Code_AFID = rs.Spend_Country_Code_AFID
  LEFT JOIN t7d_users_ss_sum_calc tuss
    ON bcc.Report_date = tuss.Report_date AND bcc.App_Name = tuss.App_Name
    AND bcc.Country_Code = tuss.Country_Code AND bcc.Spend_Country_Code_AFID = tuss.Spend_Country_Code_AFID
  LEFT JOIN t7d_new_users_calc t7dnu
    ON bcc.Report_date = t7dnu.Report_date AND bcc.App_Name = t7dnu.App_Name
    AND bcc.Country_Code = t7dnu.Country_Code AND bcc.Spend_Country_Code_AFID = t7dnu.Spend_Country_Code_AFID
),

first_null_detection AS (
  SELECT 
    wdm.*,
    MIN(CASE 
      WHEN wdm.Billing_Cycle = 0 THEN NULL
      WHEN wdm.Billing_Cycle >= 1 
        AND (wdm.Rebills_raw IS NULL OR wdm.Rebills_raw < 25)
      THEN wdm.Billing_Cycle
      ELSE NULL
    END) OVER (
      PARTITION BY wdm.App_Name, wdm.Country_Code, wdm.Spend_Country_Code_AFID, wdm.Report_date, wdm.Cohort, wdm.Table_Type
      ORDER BY wdm.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS First_Null_BC,
    MIN(CASE 
      WHEN wdm.Billing_Cycle = 0 THEN NULL
      WHEN wdm.Billing_Cycle >= 1 
        AND (wdm.Rebills_raw IS NULL OR wdm.Rebills_raw < 25)
      THEN wdm.Billing_Cycle
      ELSE NULL
    END) OVER (
      PARTITION BY wdm.App_Name, wdm.Country_Code, wdm.Spend_Country_Code_AFID, wdm.Report_date, wdm.Cohort, wdm.Table_Type
    ) AS Partition_First_Null_BC
  FROM with_daily_metrics wdm
)

SELECT 
  Report_date AS Reporting_Date,
  Active_Inactive,
  Billing_Cycle AS BC,
  App_Name,
  Country_Code AS Country,
  Spend_Country_Code_AFID,
  
  CAST(Subscription_users AS INT64) AS Subscriptions,
  CAST(Rebills_raw AS INT64) AS Rebills,
  CAST(Single_Sale_Broadcasted AS INT64) AS Single_Sale,
  
  CASE WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL ELSE Churn_rate END AS Churn_Rate,
  CASE WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL ELSE Refund_ratio END AS Refund_Rate,
  CASE WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL ELSE Cumulative_Refund_Rate END AS Cumulative_Refund_Rate,
  CASE WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL ELSE Retention_rate END AS Gross_ARPU_Retention_Rate,
  CASE WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL ELSE NET_Retention_rate END AS Net_ARPU_Retention_Rate,
  
  NULLIF(Recent_CAC_Broadcasted, 0) AS Recent_CAC,
  T30D_New_Users_Broadcasted AS T30D_New_Users,
  
  Daily_Allocated_Spend,
  Recent_Spend,
  T7D_Spend,
  Daily_New_Users,
  Daily_SS_Users,
  T7D_Daily_SS_Users,
  NULLIF(Daily_CAC, 0) AS Daily_CAC,
  T7D_CAC_SS,
  T7D_New_Users,
  
  CASE WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL ELSE NULLIF(Gross_ARPU_Discounted, 0) END AS Gross_ARPU_Discounted,
  CASE WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL ELSE NULLIF(Net_ARPU_Discounted_Cumulative, 0) END AS Net_ARPU_Discounted,
  CASE WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL ELSE NULLIF(Net_LTV_Discounted_Cumulative, 0) END AS Net_LTV_Discounted,
  
  CASE WHEN Partition_First_Null_BC IS NOT NULL AND 4 >= Partition_First_Null_BC THEN NULL ELSE NULLIF(BC4_CAC_Ceiling, 0) END AS BC4_CAC_Ceiling,
  CASE WHEN Partition_First_Null_BC IS NOT NULL AND 4 >= Partition_First_Null_BC THEN NULL ELSE NULLIF(BC4_Net_LTV_Discounted_Raw, 0) END AS BC4_Net_LTV_Discounted,
  
  CASE 
    WHEN Partition_First_Null_BC IS NOT NULL AND 4 >= Partition_First_Null_BC THEN NULL
    WHEN COALESCE(T30D_New_Users_Broadcasted, 0) = 0 THEN NULL
    WHEN COALESCE(BC4_Net_LTV_Discounted_Raw, 0) = 0 THEN NULL
    ELSE T30D_New_Users_Broadcasted * BC4_Net_LTV_Discounted_Raw
  END AS Profit,
  
  Cohort,
  Table_Type AS Table

FROM first_null_detection
ORDER BY Reporting_Date DESC, App_Name, Country, Spend_Country_Code_AFID, Cohort, Table, BC;
