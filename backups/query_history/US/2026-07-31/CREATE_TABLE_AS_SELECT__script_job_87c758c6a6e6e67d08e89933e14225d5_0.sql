-- job_id: script_job_87c758c6a6e6e67d08e89933e14225d5_0
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T12:06:18.803000+00:00
-- started: 2026-07-31T12:06:19.362000+00:00
-- ended: 2026-07-31T12:06:29.895000+00:00

CREATE OR REPLACE TABLE `Icarus_Spend_Country_AFID.SCA_Final_Table` AS
 
WITH 
unioned_data AS (
  -- Table 1: SCA_7K_30D_Crystal_Ball
  SELECT 
    Report_date, Product_Name_Final, Billing_Cycle, Entity_Name, App_Name,
    Trial_Type, Country_Code, Spend_Country_Code_AFID, Product_SCA,
    Subscription_users, CB_User as Rebills_raw, SS_Users,
    Churn_rate, Refund_ratio, Retention_rate, NET_Retention_rate,
    Recent_CAC, T30D_New_Users, ARPU_Discounted, Net_ARPU_Discounted,
    Net_LTV_Discounted, '7K_30D' as Cohort, 'Crystal Ball' as Table_Type
  FROM `Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball`
  
  UNION ALL
  
  -- Table 2: SCA_7K_Crystal_Ball
  SELECT 
    Report_date, Product_Name_Final, Billing_Cycle, Entity_Name, App_Name,
    Trial_Type, Country_Code, Spend_Country_Code_AFID, Product_SCA,
    Subscription_users, CB_User as Rebills_raw, SS_Users,
    Churn_rate, Refund_ratio, Retention_rate, NET_Retention_rate,
    Recent_CAC, T30D_New_Users, ARPU_Discounted, Net_ARPU_Discounted,
    Net_LTV_Discounted, '7K' as Cohort, 'Crystal Ball' as Table_Type
  FROM `Icarus_Spend_Country_AFID.SCA_7K_Crystal_Ball`
  
  UNION ALL
  
  -- Table 3: SCA_7K_30D_Main_Table
  SELECT 
    Report_date, Product_Name_Final, Billing_Cycle, Entity_Name, App_Name,
    Trial_Type, Country_Code, Spend_Country_Code_AFID, Product_SCA,
    Subscription_users, Rebill_users as Rebills_raw, SS_Users,
    Churn_rate, Refund_ratio, Retention_rate, NET_Retention_rate,
    Recent_CAC, NULL as T30D_New_Users, ARPU_Discounted, Net_ARPU_Discounted,
    Net_LTV_Discounted, '7K_30D' as Cohort, 'Regular' as Table_Type
  FROM `Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table`
  
  UNION ALL
  
  -- Table 4: SCA_7K_Main_Table
  SELECT 
    Report_date, Product_Name_Final, Billing_Cycle, Entity_Name, App_Name,
    Trial_Type, Country_Code, Spend_Country_Code_AFID, Product_SCA,
    Subscription_users, Rebill_users as Rebills_raw, SS_Users,
    Churn_rate, Refund_ratio, Retention_rate, NET_Retention_rate,
    Recent_CAC, NULL as T30D_New_Users, ARPU_Discounted, Net_ARPU_Discounted,
    Net_LTV_Discounted, '7K' as Cohort, 'Regular' as Table_Type
  FROM `Icarus_Spend_Country_AFID.SCA_7K_Main_Table`
),

cumulative_metrics AS (
  SELECT 
    ud.*,
    SUM(ud.ARPU_Discounted) OVER (
      PARTITION BY ud.Product_SCA, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as Gross_ARPU_Discounted,
    SUM(ud.Net_ARPU_Discounted) OVER (
      PARTITION BY ud.Product_SCA, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as Net_ARPU_Discounted_Cumulative,
    SUM(ud.Net_LTV_Discounted) OVER (
      PARTITION BY ud.Product_SCA, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as Net_LTV_Discounted_Cumulative,
       SUM(ud.Refund_ratio) OVER (
      PARTITION BY ud.Product_SCA, ud.Report_date, ud.Cohort, ud.Table_Type
      ORDER BY ud.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as Cumulative_Refund_Ratio
  FROM unioned_data ud
),
 

recent_cac_broadcast AS (
  SELECT 
    cm.*,
    MAX(CASE 
      WHEN cm.Trial_Type = 'NT' AND cm.Billing_Cycle = 1 THEN cm.Recent_CAC
      WHEN cm.Trial_Type != 'NT' AND cm.Billing_Cycle = 0 THEN cm.Recent_CAC
      ELSE NULL
    END) OVER (
      PARTITION BY cm.Product_SCA, cm.Report_date, cm.Cohort, cm.Table_Type
    ) as Recent_CAC_Broadcasted,
    MAX(CASE 
      WHEN cm.Trial_Type = 'NT' AND cm.Billing_Cycle = 1 THEN cm.T30D_New_Users
      WHEN cm.Trial_Type != 'NT' AND cm.Billing_Cycle = 0 THEN cm.T30D_New_Users
      ELSE NULL
    END) OVER (
      PARTITION BY cm.Product_SCA, cm.Report_date, cm.Cohort, cm.Table_Type
    ) as T30D_New_Users_Broadcasted
  FROM cumulative_metrics cm
),

bc4_ceiling_calc AS (
  SELECT 
    rcb.*,
    MAX(CASE WHEN rcb.Billing_Cycle = 4 THEN rcb.Net_ARPU_Discounted_Cumulative ELSE NULL END) 
      OVER (PARTITION BY rcb.Product_SCA, rcb.Report_date, rcb.Cohort, rcb.Table_Type) - 1.2 
      as BC4_CAC_Ceiling
  FROM recent_cac_broadcast rcb
),

first_null_detection AS (
  SELECT 
    bcc.*,
    MIN(CASE 
      WHEN bcc.Trial_Type = 'NT' AND bcc.Billing_Cycle = 0 THEN NULL
      WHEN (bcc.Trial_Type != 'NT' AND bcc.Billing_Cycle = 0) 
        OR (bcc.Trial_Type = 'NT' AND bcc.Billing_Cycle = 1)
      THEN 
        CASE WHEN (bcc.Subscription_users IS NULL OR bcc.Subscription_users = 0) 
               OR (bcc.Rebills_raw IS NULL OR bcc.Rebills_raw < 25)
             THEN bcc.Billing_Cycle ELSE NULL END
      WHEN (bcc.Trial_Type != 'NT' AND bcc.Billing_Cycle > 0) 
        OR (bcc.Trial_Type = 'NT' AND bcc.Billing_Cycle > 1)
      THEN 
        CASE WHEN bcc.Rebills_raw IS NULL OR bcc.Rebills_raw < 25
             THEN bcc.Billing_Cycle ELSE NULL END
      ELSE NULL
    END) OVER (
      PARTITION BY bcc.Product_SCA, bcc.Report_date, bcc.Cohort, bcc.Table_Type
      ORDER BY bcc.Billing_Cycle
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as First_Null_BC
  FROM bc4_ceiling_calc bcc
),

with_active_status AS (
  SELECT 
    fnd.*,
    CASE WHEN ap.Product_Name_Final IS NOT NULL THEN 'Active' ELSE 'Inactive' END as active_inactive_status
  FROM first_null_detection fnd
  LEFT JOIN (
    SELECT DISTINCT App_Name, Product_Name_Final
    FROM `variant-finance-data-project.ICARUS_Multi.Active_Plans_6M`
  ) ap
    ON fnd.App_Name = ap.App_Name 
    AND fnd.Product_Name_Final = ap.Product_Name_Final
),

daily_spend_calc AS (
  SELECT 
    was.Report_date,
    was.App_Name,
    was.Product_Name_Final,
    was.Spend_Country_Code_AFID,
    SUM(ads.allocated_spend) AS Daily_Allocated_Spend
  FROM (
    SELECT DISTINCT Report_date, App_Name, Product_Name_Final, Spend_Country_Code_AFID 
    FROM with_active_status
  ) was
  LEFT JOIN `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL` ads
    ON ads.App_Name = was.App_Name
    AND ads.Product_Name_final = was.Product_Name_Final
    AND ads.Country = was.Spend_Country_Code_AFID
    AND ads.Date = was.Report_date
  GROUP BY was.Report_date, was.App_Name, was.Product_Name_Final, was.Spend_Country_Code_AFID
),

daily_users_calc AS (
  SELECT 
    was.Report_date,
    was.App_Name,
    was.Product_Name_Final,
    was.Spend_Country_Code_AFID,
    COUNT(DISTINCT base.Updated_Cust_ID) AS Daily_New_Users
  FROM (
    SELECT DISTINCT Report_date, App_Name, Product_Name_Final, Spend_Country_Code_AFID 
    FROM with_active_status
  ) was
  LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON LEFT(base.App_Name, 2) = LEFT(was.App_Name, 2)
    AND base.Product_name_Final = was.Product_Name_Final
    AND base.Spend_Country_Code_AFID = was.Spend_Country_Code_AFID
    AND base.Date_of_Sale = was.Report_date
    AND base.Trial_Type IS NOT NULL
    AND base.Trial_Type != 'SS'
    AND (
      (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
      OR (base.Trial_Type != 'NT' AND base.Billing_Cycle_Updated = 0)
    )
  GROUP BY was.Report_date, was.App_Name, was.Product_Name_Final, was.Spend_Country_Code_AFID
),
t7d_daily_ss_users_calc AS (
  SELECT 
    Report_date, App_Name, Spend_Country_Code_AFID,
    SUM(daily_distinct_count) / 7.0 AS T7D_Daily_SS_Users
  FROM (
    SELECT 
      was.Report_date, was.App_Name, was.Spend_Country_Code_AFID, day_date,
      COUNT(DISTINCT base.Updated_Cust_ID) AS daily_distinct_count
    FROM (
      SELECT DISTINCT Report_date, App_Name, Spend_Country_Code_AFID 
      FROM with_active_status
    ) was
    CROSS JOIN UNNEST(GENERATE_DATE_ARRAY(DATE_SUB(was.Report_date, INTERVAL 6 DAY), was.Report_date)) AS day_date
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
      ON LEFT(base.App_Name, 2) = LEFT(was.App_Name, 2)
      AND base.Spend_Country_Code_AFID = was.Spend_Country_Code_AFID
      AND base.Date_of_Sale = day_date
      AND RIGHT(base.Product_name_Final, 2) = 'SS'
      AND base.Billing_Cycle_Updated = 0
    GROUP BY was.Report_date, was.App_Name, was.Spend_Country_Code_AFID, day_date
  )
  GROUP BY Report_date, App_Name, Spend_Country_Code_AFID
),
t7d_new_users_calc AS (
  SELECT 
    Report_date, App_Name, Product_Name_Final, Spend_Country_Code_AFID,
    SUM(daily_distinct_count) / 7.0 AS T7D_New_Users
  FROM (
    SELECT 
      was.Report_date, was.App_Name, was.Product_Name_Final, was.Spend_Country_Code_AFID, day_date,
      COUNT(DISTINCT base.Updated_Cust_ID) AS daily_distinct_count
    FROM (
      SELECT DISTINCT Report_date, App_Name, Product_Name_Final, Spend_Country_Code_AFID 
      FROM with_active_status
    ) was
    CROSS JOIN UNNEST(GENERATE_DATE_ARRAY(DATE_SUB(was.Report_date, INTERVAL 6 DAY), was.Report_date)) AS day_date
    LEFT JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
      ON LEFT(base.App_Name, 2) = LEFT(was.App_Name, 2)
      AND base.Product_name_Final = was.Product_Name_Final
      AND base.Spend_Country_Code_AFID = was.Spend_Country_Code_AFID
      AND base.Date_of_Sale = day_date
      AND base.Trial_Type IS NOT NULL
      AND base.Trial_Type != 'SS'
      AND (
        (base.Trial_Type = 'NT' AND base.Billing_Cycle_Updated = 1)
        OR (base.Trial_Type != 'NT' AND base.Billing_Cycle_Updated = 0)
      )
    GROUP BY was.Report_date, was.App_Name, was.Product_Name_Final, was.Spend_Country_Code_AFID, day_date
  )
  GROUP BY Report_date, App_Name, Product_Name_Final, Spend_Country_Code_AFID
),

with_daily_metrics AS (
  SELECT 
    was.*,
    COALESCE(ds.Daily_Allocated_Spend, 0) AS Daily_Allocated_Spend,
    COALESCE(du.Daily_New_Users, 0) AS Daily_New_Users,
    COALESCE(SAFE_DIVIDE(ds.Daily_Allocated_Spend, NULLIF(du.Daily_New_Users, 0)), 0) AS Daily_CAC,
    t7dss.T7D_Daily_SS_Users,
    t7dnu.T7D_New_Users
  FROM with_active_status was
  LEFT JOIN daily_spend_calc ds
    ON was.Report_date = ds.Report_date 
    AND was.App_Name = ds.App_Name
    AND was.Product_Name_Final = ds.Product_Name_Final
    AND was.Spend_Country_Code_AFID = ds.Spend_Country_Code_AFID
  LEFT JOIN daily_users_calc du
    ON was.Report_date = du.Report_date 
    AND was.App_Name = du.App_Name
    AND was.Product_Name_Final = du.Product_Name_Final
    AND was.Spend_Country_Code_AFID = du.Spend_Country_Code_AFID
 LEFT JOIN t7d_daily_ss_users_calc t7dss
    ON was.Report_date = t7dss.Report_date 
    AND was.App_Name = t7dss.App_Name
    AND was.Spend_Country_Code_AFID = t7dss.Spend_Country_Code_AFID
  LEFT JOIN t7d_new_users_calc t7dnu
    ON was.Report_date = t7dnu.Report_date 
    AND was.App_Name = t7dnu.App_Name
    AND was.Product_Name_Final = t7dnu.Product_Name_Final
    AND was.Spend_Country_Code_AFID = t7dnu.Spend_Country_Code_AFID
)
SELECT 
  Report_date as Reporting_Date,
  CASE 
    WHEN Country_Code IS NOT NULL AND Country_Code != '' AND TRIM(Country_Code) != ''
    THEN CONCAT(Product_Name_Final, '-', Country_Code)
    ELSE Product_Name_Final
  END as Plan_Name,
  active_inactive_status as Active_Inactive,
  Billing_Cycle as BC,
  Entity_Name,
  App_Name,
  Trial_Type,
  Country_Code as Country,
  Spend_Country_Code_AFID,
  
  CASE WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL ELSE Subscription_users END as Subscriptions,
  CASE WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL ELSE Rebills_raw END as Rebills,
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN (Trial_Type = 'NT' AND Billing_Cycle = 1) OR (Trial_Type != 'NT' AND Billing_Cycle = 0) THEN SS_Users
    ELSE NULL
  END as Single_Sale,
  
  CASE WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
       WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
       ELSE Churn_rate END as Churn_Rate,
  CASE WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
       WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
       ELSE Refund_ratio END as Refund_Rate,
         -- 👇 NEW
  CASE WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
       WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
       ELSE Cumulative_Refund_Ratio END as Cumulative_Refund_Rate,

  CASE WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
       WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
       ELSE Retention_rate END as Gross_ARPU_Retention_Rate,
  CASE WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
       WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
       ELSE NET_Retention_rate END as Net_ARPU_Retention_Rate,
  
  CASE WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL ELSE Recent_CAC_Broadcasted END as Recent_CAC,
  CASE WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL ELSE T30D_New_Users_Broadcasted END as T30D_New_Users,
  Daily_Allocated_Spend AS Daily_Spend,
  Daily_New_Users,
  NULLIF(Daily_CAC, 0) AS Daily_CAC,
  T7D_Daily_SS_Users,
  T7D_New_Users,
  CASE WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
       WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
       ELSE Gross_ARPU_Discounted END as Gross_ARPU_Discounted,
  CASE WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
       WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
       ELSE Net_ARPU_Discounted_Cumulative END as Net_ARPU_Discounted,
  CASE WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
       WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
       ELSE Net_LTV_Discounted_Cumulative END as Net_LTV_Discounted,
  
  CASE 
    WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
    WHEN (Subscription_users IS NULL OR Subscription_users = 0) 
     AND (Rebills_raw IS NULL OR Rebills_raw = 0) THEN NULL
    ELSE BC4_CAC_Ceiling
  END as BC4_CAC_Ceiling,
  
  Cohort,
  Table_Type as Table,
  Product_SCA

FROM with_daily_metrics
ORDER BY Reporting_Date DESC, Product_SCA, Cohort, Table, BC
