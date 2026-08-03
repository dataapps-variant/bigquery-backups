CREATE OR REPLACE PROCEDURE `Icarus_Spend_Country_AFID.proc_SCA_Final_Table`()
BEGIN

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
    ) as Net_LTV_Discounted_Cumulative
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
  CASE WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
       WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
       ELSE Retention_rate END as Gross_ARPU_Retention_Rate,
  CASE WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL
       WHEN First_Null_BC IS NOT NULL AND Billing_Cycle >= First_Null_BC THEN NULL
       ELSE NET_Retention_rate END as Net_ARPU_Retention_Rate,
  
  CASE WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL ELSE Recent_CAC_Broadcasted END as Recent_CAC,
  CASE WHEN Trial_Type = 'NT' AND Billing_Cycle = 0 THEN NULL ELSE T30D_New_Users_Broadcasted END as T30D_New_Users,
  
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

FROM with_active_status
ORDER BY Reporting_Date DESC, Product_SCA, Cohort, Table, BC;

END;
