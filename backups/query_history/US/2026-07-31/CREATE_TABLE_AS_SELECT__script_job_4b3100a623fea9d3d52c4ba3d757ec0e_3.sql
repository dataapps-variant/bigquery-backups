-- job_id: script_job_4b3100a623fea9d3d52c4ba3d757ec0e_3
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-31T12:47:38.867000+00:00
-- started: 2026-07-31T12:47:39.481000+00:00
-- ended: 2026-07-31T12:47:41.002000+00:00

CREATE OR REPLACE TABLE `variant-finance-data-project.Sticky_Data.LMC_Refund` AS

WITH base_data AS (
  SELECT
    Product_Name_Final,
    Updated_Cust_ID,
    Trial_Type,
    Is_Refund,
    CAST(Billing_Cycle_Updated AS INT64) AS Billing_Cycle_Updated,
    DATE_TRUNC(DATE(PARSE_DATETIME('%Y-%m-%d %H:%M:%S', Acquisition_Date_Time)), MONTH) AS Acquisition_Month,
CASE 
  WHEN Product_Name_Final LIKE 'CT%' AND Spend_Country_Code_AFID = 'JP' THEN 'JP'
  WHEN Product_Name_Final LIKE 'CT%' THEN 'Non-JP'
  ELSE NULL
END AS CT_Country_Group
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE RIGHT(Product_Name_Final, 2) != 'SS'
),

logical_bc AS (
  SELECT
    b.Product_Name_Final,
    b.Updated_Cust_ID,
    b.Trial_Type,
    b.Is_Refund,
    b.Billing_Cycle_Updated,
    b.Acquisition_Month,
    b.CT_Country_Group,
    COALESCE(bf.Billing_Frequency, 1) AS Billing_Frequency,
    CASE 
      WHEN b.Trial_Type = 'NT' THEN b.Billing_Cycle_Updated - 1
      ELSE b.Billing_Cycle_Updated
    END AS Logical_BC
  FROM base_data b
  LEFT JOIN `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name` lkp
    ON b.Product_Name_Final = lkp.Concat
  LEFT JOIN `variant-finance-data-project.Sticky_Data.LMC_Billing_Frequency` bf
    ON COALESCE(lkp.Updated_Concat, b.Product_Name_Final) = bf.Product_Name_Final
),

bc0_cohort AS (
  SELECT
    l.Product_Name_Final,
    l.CT_Country_Group,
    FORMAT_DATE('%m-01-%Y', l.Acquisition_Month) AS Plan_Start_Month,
    l.Acquisition_Month,
    COUNT(DISTINCT l.Updated_Cust_ID) AS BC0_Users
  FROM logical_bc l
  WHERE l.Logical_BC = 0
   AND l.Acquisition_Month <= DATE_TRUNC(DATE "2026-06-30", MONTH)
  GROUP BY l.Product_Name_Final, l.CT_Country_Group, l.Acquisition_Month
),
refund_mapping AS (
  SELECT
    l.Product_Name_Final,
    l.Updated_Cust_ID,
    l.Acquisition_Month,
    l.CT_Country_Group,
    l.Billing_Frequency,
    FORMAT_DATE('%m-01-%Y', l.Acquisition_Month) AS Plan_Start_Month,
    l.Logical_BC,
    CASE 
      WHEN l.Trial_Type = 'NT' THEN DATE_ADD(l.Acquisition_Month, INTERVAL (l.Logical_BC * l.Billing_Frequency) MONTH)
      WHEN l.Logical_BC <= 1 THEN l.Acquisition_Month
      ELSE DATE_ADD(l.Acquisition_Month, INTERVAL ((l.Logical_BC - 1) * l.Billing_Frequency) MONTH)
    END AS Current_Month_Date
  FROM logical_bc l
  WHERE (l.Logical_BC >= 1 OR (l.Trial_Type = 'NT' AND l.Logical_BC = 0))
    AND l.Is_Refund = 'yes'
),

refund_counts AS (
  SELECT
    r.Product_Name_Final,
    r.CT_Country_Group,
    r.Plan_Start_Month,
    r.Acquisition_Month,
    FORMAT_DATE('%m-01-%Y', r.Current_Month_Date) AS Current_Month,
    COUNT(DISTINCT r.Updated_Cust_ID) AS refunded_users
  FROM refund_mapping r
  WHERE r.Current_Month_Date <= DATE "2026-06-30"
  GROUP BY r.Product_Name_Final, r.CT_Country_Group, r.Plan_Start_Month, r.Acquisition_Month, FORMAT_DATE('%m-01-%Y', r.Current_Month_Date)
),

combined_data AS (
  SELECT
    bc.Product_Name_Final,
    bc.CT_Country_Group,
    bc.Plan_Start_Month,
    bc.Acquisition_Month,
    bc.BC0_Users,
    rc.Current_Month,
    rc.refunded_users
  FROM bc0_cohort bc
  LEFT JOIN refund_counts rc
    ON bc.Product_Name_Final = rc.Product_Name_Final
    AND bc.Acquisition_Month = rc.Acquisition_Month
    AND ((bc.CT_Country_Group IS NULL AND rc.CT_Country_Group IS NULL)
         OR bc.CT_Country_Group = rc.CT_Country_Group)
),

base_result AS (
  SELECT
    CASE 
      WHEN cd.CT_Country_Group IS NOT NULL 
        THEN CONCAT(COALESCE(lkp.Updated_Concat, cd.Product_Name_Final), '-', cd.CT_Country_Group)
      ELSE COALESCE(lkp.Updated_Concat, cd.Product_Name_Final)
    END AS Product_Name_Final,
    cd.BC0_Users,
    cd.Plan_Start_Month,
    MAX(CASE WHEN Current_Month = '01-01-2023' THEN refunded_users ELSE NULL END) AS `01-01-2023`,
    MAX(CASE WHEN Current_Month = '02-01-2023' THEN refunded_users ELSE NULL END) AS `02-01-2023`,
    MAX(CASE WHEN Current_Month = '03-01-2023' THEN refunded_users ELSE NULL END) AS `03-01-2023`,
    MAX(CASE WHEN Current_Month = '04-01-2023' THEN refunded_users ELSE NULL END) AS `04-01-2023`,
    MAX(CASE WHEN Current_Month = '05-01-2023' THEN refunded_users ELSE NULL END) AS `05-01-2023`,
    MAX(CASE WHEN Current_Month = '06-01-2023' THEN refunded_users ELSE NULL END) AS `06-01-2023`,
    MAX(CASE WHEN Current_Month = '07-01-2023' THEN refunded_users ELSE NULL END) AS `07-01-2023`,
    MAX(CASE WHEN Current_Month = '08-01-2023' THEN refunded_users ELSE NULL END) AS `08-01-2023`,
    MAX(CASE WHEN Current_Month = '09-01-2023' THEN refunded_users ELSE NULL END) AS `09-01-2023`,
    MAX(CASE WHEN Current_Month = '10-01-2023' THEN refunded_users ELSE NULL END) AS `10-01-2023`,
    MAX(CASE WHEN Current_Month = '11-01-2023' THEN refunded_users ELSE NULL END) AS `11-01-2023`,
    MAX(CASE WHEN Current_Month = '12-01-2023' THEN refunded_users ELSE NULL END) AS `12-01-2023`,
    MAX(CASE WHEN Current_Month = '01-01-2024' THEN refunded_users ELSE NULL END) AS `01-01-2024`,
    MAX(CASE WHEN Current_Month = '02-01-2024' THEN refunded_users ELSE NULL END) AS `02-01-2024`,
    MAX(CASE WHEN Current_Month = '03-01-2024' THEN refunded_users ELSE NULL END) AS `03-01-2024`,
    MAX(CASE WHEN Current_Month = '04-01-2024' THEN refunded_users ELSE NULL END) AS `04-01-2024`,
    MAX(CASE WHEN Current_Month = '05-01-2024' THEN refunded_users ELSE NULL END) AS `05-01-2024`,
    MAX(CASE WHEN Current_Month = '06-01-2024' THEN refunded_users ELSE NULL END) AS `06-01-2024`,
    MAX(CASE WHEN Current_Month = '07-01-2024' THEN refunded_users ELSE NULL END) AS `07-01-2024`,
    MAX(CASE WHEN Current_Month = '08-01-2024' THEN refunded_users ELSE NULL END) AS `08-01-2024`,
    MAX(CASE WHEN Current_Month = '09-01-2024' THEN refunded_users ELSE NULL END) AS `09-01-2024`,
    MAX(CASE WHEN Current_Month = '10-01-2024' THEN refunded_users ELSE NULL END) AS `10-01-2024`,
    MAX(CASE WHEN Current_Month = '11-01-2024' THEN refunded_users ELSE NULL END) AS `11-01-2024`,
    MAX(CASE WHEN Current_Month = '12-01-2024' THEN refunded_users ELSE NULL END) AS `12-01-2024`,
    MAX(CASE WHEN Current_Month = '01-01-2025' THEN refunded_users ELSE NULL END) AS `01-01-2025`,
    MAX(CASE WHEN Current_Month = '02-01-2025' THEN refunded_users ELSE NULL END) AS `02-01-2025`,
    MAX(CASE WHEN Current_Month = '03-01-2025' THEN refunded_users ELSE NULL END) AS `03-01-2025`,
    MAX(CASE WHEN Current_Month = '04-01-2025' THEN refunded_users ELSE NULL END) AS `04-01-2025`,
    MAX(CASE WHEN Current_Month = '05-01-2025' THEN refunded_users ELSE NULL END) AS `05-01-2025`,
    MAX(CASE WHEN Current_Month = '06-01-2025' THEN refunded_users ELSE NULL END) AS `06-01-2025`,
    MAX(CASE WHEN Current_Month = '07-01-2025' THEN refunded_users ELSE NULL END) AS `07-01-2025`,
    MAX(CASE WHEN Current_Month = '08-01-2025' THEN refunded_users ELSE NULL END) AS `08-01-2025`,
    MAX(CASE WHEN Current_Month = '09-01-2025' THEN refunded_users ELSE NULL END) AS `09-01-2025`,
    MAX(CASE WHEN Current_Month = '10-01-2025' THEN refunded_users ELSE NULL END) AS `10-01-2025`,
    MAX(CASE WHEN Current_Month = '11-01-2025' THEN refunded_users ELSE NULL END) AS `11-01-2025`,
    MAX(CASE WHEN Current_Month = '12-01-2025' THEN refunded_users ELSE NULL END) AS `12-01-2025`,
    MAX(CASE WHEN Current_Month = '01-01-2026' THEN refunded_users ELSE NULL END) AS `01-01-2026`,
    MAX(CASE WHEN Current_Month = '02-01-2026' THEN refunded_users ELSE NULL END) AS `02-01-2026`,
    MAX(CASE WHEN Current_Month = '03-01-2026' THEN refunded_users ELSE NULL END) AS `03-01-2026`,
    MAX(CASE WHEN Current_Month = '04-01-2026' THEN refunded_users ELSE NULL END) AS `04-01-2026`,
    MAX(CASE WHEN Current_Month = '05-01-2026' THEN refunded_users ELSE NULL END) AS `05-01-2026`,
    MAX(CASE WHEN Current_Month = '06-01-2026' THEN refunded_users ELSE NULL END) AS `06-01-2026`
  FROM combined_data cd
  LEFT JOIN `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name` lkp
    ON cd.Product_Name_Final = lkp.Concat
  GROUP BY 
    CASE 
      WHEN cd.CT_Country_Group IS NOT NULL 
        THEN CONCAT(COALESCE(lkp.Updated_Concat, cd.Product_Name_Final), '-', cd.CT_Country_Group)
      ELSE COALESCE(lkp.Updated_Concat, cd.Product_Name_Final)
    END,
    cd.Plan_Start_Month, cd.Acquisition_Month, cd.BC0_Users
)

SELECT
  Product_Name_Final,
  SUM(BC0_Users) AS BC0_Users,
  Plan_Start_Month,
  SUM(`01-01-2023`) AS `01-01-2023`,
    SUM(`02-01-2023`) AS `02-01-2023`,
    SUM(`03-01-2023`) AS `03-01-2023`,
    SUM(`04-01-2023`) AS `04-01-2023`,
    SUM(`05-01-2023`) AS `05-01-2023`,
    SUM(`06-01-2023`) AS `06-01-2023`,
    SUM(`07-01-2023`) AS `07-01-2023`,
    SUM(`08-01-2023`) AS `08-01-2023`,
    SUM(`09-01-2023`) AS `09-01-2023`,
    SUM(`10-01-2023`) AS `10-01-2023`,
    SUM(`11-01-2023`) AS `11-01-2023`,
    SUM(`12-01-2023`) AS `12-01-2023`,
    SUM(`01-01-2024`) AS `01-01-2024`,
    SUM(`02-01-2024`) AS `02-01-2024`,
    SUM(`03-01-2024`) AS `03-01-2024`,
    SUM(`04-01-2024`) AS `04-01-2024`,
    SUM(`05-01-2024`) AS `05-01-2024`,
    SUM(`06-01-2024`) AS `06-01-2024`,
    SUM(`07-01-2024`) AS `07-01-2024`,
    SUM(`08-01-2024`) AS `08-01-2024`,
    SUM(`09-01-2024`) AS `09-01-2024`,
    SUM(`10-01-2024`) AS `10-01-2024`,
    SUM(`11-01-2024`) AS `11-01-2024`,
    SUM(`12-01-2024`) AS `12-01-2024`,
    SUM(`01-01-2025`) AS `01-01-2025`,
    SUM(`02-01-2025`) AS `02-01-2025`,
    SUM(`03-01-2025`) AS `03-01-2025`,
    SUM(`04-01-2025`) AS `04-01-2025`,
    SUM(`05-01-2025`) AS `05-01-2025`,
    SUM(`06-01-2025`) AS `06-01-2025`,
    SUM(`07-01-2025`) AS `07-01-2025`,
    SUM(`08-01-2025`) AS `08-01-2025`,
    SUM(`09-01-2025`) AS `09-01-2025`,
    SUM(`10-01-2025`) AS `10-01-2025`,
    SUM(`11-01-2025`) AS `11-01-2025`,
    SUM(`12-01-2025`) AS `12-01-2025`,
    SUM(`01-01-2026`) AS `01-01-2026`,
    SUM(`02-01-2026`) AS `02-01-2026`,
    SUM(`03-01-2026`) AS `03-01-2026`,
    SUM(`04-01-2026`) AS `04-01-2026`,
    SUM(`05-01-2026`) AS `05-01-2026`,
    SUM(`06-01-2026`) AS `06-01-2026`
FROM base_result
GROUP BY Product_Name_Final, Plan_Start_Month
ORDER BY Product_Name_Final, Plan_Start_Month
