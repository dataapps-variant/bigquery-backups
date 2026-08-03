-- job_id: scheduled_query_6a7568bd-0000-241f-b942-f4f5e8070184
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T10:31:25.220000+00:00
-- started: 2026-07-29T10:31:25.554000+00:00
-- ended: 2026-07-29T10:31:59.555000+00:00


CREATE OR REPLACE TABLE `Icarus_Spend_Country_AFID.SCA_7K_SOT_Ratio` AS

WITH
config AS (
  SELECT 
    DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) AS report_start_date,
    DATE('2025-01-01') AS report_end_date,
    7000 AS cohort_size,
    12 AS max_billing_cycles
),

report_dates AS (
  SELECT report_date
  FROM UNNEST(GENERATE_DATE_ARRAY(
    (SELECT report_end_date FROM config),
    (SELECT report_start_date FROM config),
    INTERVAL 1 DAY
  )) AS report_date
),

plan_sca_list AS (
  SELECT DISTINCT
    Product_Name_Final,
    CASE 
      WHEN Country_Code IS NOT NULL AND Country_Code != '' 
      THEN CONCAT(App_Name, '-', Country_Code)
      ELSE App_Name
    END AS App_Name,
    Country_Code,
    Spend_Country_Code_AFID,
    First_Date_of_Sale
  FROM `Icarus_Spend_Country_AFID.SCA_Plan_List`
  WHERE Product_Name_Final IS NOT NULL
    AND Spend_Country_Code_AFID IS NOT NULL
),

billing_cycle_range AS (
  SELECT billing_cycle
  FROM UNNEST(GENERATE_ARRAY(0, (SELECT max_billing_cycles FROM config))) AS billing_cycle
),

master_combinations AS (
  SELECT 
    rd.report_date,
    psl.Product_Name_Final,
    psl.App_Name,
    psl.Country_Code,
    psl.Spend_Country_Code_AFID,
    bcr.billing_cycle,
    cfg.cohort_size
  FROM report_dates rd
  CROSS JOIN plan_sca_list psl
  CROSS JOIN billing_cycle_range bcr
  CROSS JOIN config cfg
  WHERE rd.report_date >= psl.First_Date_of_Sale
),

subscription_cohort AS (
  SELECT 
    mc.report_date,
    mc.Product_Name_Final,
    mc.App_Name,
    mc.Country_Code,
    mc.Spend_Country_Code_AFID,
    mc.billing_cycle,
    mc.cohort_size,
    base.Updated_Cust_ID,
    base.Delay_days_SOT,
    ROW_NUMBER() OVER (
      PARTITION BY mc.report_date, mc.Product_Name_Final, mc.Country_Code, mc.Spend_Country_Code_AFID, mc.billing_cycle
      ORDER BY base.Date_of_Sale DESC
    ) AS user_rank
  FROM master_combinations mc
  INNER JOIN `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` base
    ON base.Product_Name_Final_Merged = mc.Product_Name_Final
    AND base.Spend_Country_Code_AFID = mc.Spend_Country_Code_AFID
    AND base.Billing_Cycle_Updated = mc.billing_cycle
    AND base.Date_of_Sale <= mc.report_date
    AND base.Trial_Type IS NOT NULL
    AND base.Trial_Type != 'SS'
    AND (
      (LEFT(mc.App_Name, 2) = 'CT' AND mc.App_Name NOT LIKE '%Non-JP%'
        AND mc.Country_Code = 'JP' AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(mc.App_Name, 2) = 'CT' AND mc.App_Name LIKE '%Non-JP%'
        AND mc.Country_Code = 'Non-JP' AND base.Spend_Country_Code_AFID != 'JP')
      OR
      (LEFT(mc.App_Name, 2) != 'CT' AND mc.Country_Code = 'JP'
        AND base.Spend_Country_Code_AFID = 'JP')
      OR
      (LEFT(mc.App_Name, 2) != 'CT' AND mc.Country_Code = 'Non-JP'
        AND (base.Spend_Country_Code_AFID != 'JP' OR base.Spend_Country_Code_AFID IS NULL))
      OR
      (mc.Country_Code IS NULL OR mc.Country_Code = '')
    )
),

top_cohort AS (
  SELECT 
    report_date, Product_Name_Final, App_Name, Country_Code,
    Spend_Country_Code_AFID, billing_cycle, Updated_Cust_ID, Delay_days_SOT
  FROM subscription_cohort
  WHERE user_rank <= (SELECT cohort_size FROM config)
),

metrics AS (
  SELECT 
    report_date, Product_Name_Final, Country_Code,
    Spend_Country_Code_AFID, billing_cycle,
    COUNT(Updated_Cust_ID) AS subscription_users,
    COUNT(CASE WHEN Delay_days_SOT <= 0 OR Delay_days_SOT IS NULL THEN 1 END) AS sot_users
  FROM top_cohort
  GROUP BY report_date, Product_Name_Final, Country_Code, Spend_Country_Code_AFID, billing_cycle
)

SELECT 
  mc.report_date AS Report_date,
  mc.Product_Name_Final,
  mc.Country_Code,
  mc.Spend_Country_Code_AFID,
  mc.billing_cycle AS Billing_Cycle,
  mc.cohort_size AS Cohort_Size,
  COALESCE(m.subscription_users, 0) AS Subscription_users,
  COALESCE(m.sot_users, 0) AS SOT_Users,
  COALESCE(
    SAFE_DIVIDE(
      COALESCE(m.sot_users, 0),
      NULLIF(COALESCE(m.subscription_users, 0), 0)
    ),
    0
  ) AS SOT_Ratio

FROM master_combinations mc
LEFT JOIN metrics m
  ON mc.report_date = m.report_date
  AND mc.Product_Name_Final = m.Product_Name_Final
  AND mc.Country_Code = m.Country_Code
  AND mc.Spend_Country_Code_AFID = m.Spend_Country_Code_AFID
  AND mc.billing_cycle = m.billing_cycle
ORDER BY mc.report_date DESC, mc.Product_Name_Final, mc.Country_Code, mc.Spend_Country_Code_AFID, mc.billing_cycle;
