CREATE OR REPLACE TABLE `variant-finance-data-project.R100.R100_Shape_of_tale` AS
WITH src AS (
  SELECT
    CASE
  WHEN s.App_Name = 'CT' AND s.Spend_Country_Code_AFID = 'JP' THEN 'CT-JP'
  WHEN s.App_Name = 'CT' THEN 'CT-Non-JP'
  ELSE s.App_Name
END AS App_Name,
    s.Product_Name_Final AS Original_Product,
    s.Trial_Type,
    CAST(s.Billing_Cycle_Updated AS INT64) AS BC,
    s.Updated_Cust_ID,
    CASE
      WHEN s.Delay_days_SOT IS NULL THEN NULL
      WHEN CAST(s.Delay_days_SOT AS INT64) < 0  THEN 0
      WHEN CAST(s.Delay_days_SOT AS INT64) > 30 THEN 30
      ELSE CAST(s.Delay_days_SOT AS INT64)
    END AS SOT_Days_Bucketed
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` s
  WHERE s.Date_of_Sale >= DATE_SUB(CURRENT_DATE(), INTERVAL 100 DAY)
    AND s.Date_of_Sale <= DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
    AND s.App_Name IS NOT NULL
    AND s.Product_Name_Final IS NOT NULL
    AND s.Billing_Cycle_Updated IS NOT NULL
    AND s.Trial_Type IS NOT NULL
    AND CAST(s.Billing_Cycle_Updated AS INT64) BETWEEN 0 AND 36
),
totals_per_original AS (
  SELECT
    App_Name, Original_Product, Trial_Type, BC,
    COUNT(DISTINCT Updated_Cust_ID) AS Total_Users
  FROM src
  GROUP BY App_Name, Original_Product, Trial_Type, BC
),
delay_per_original AS (
  SELECT
    App_Name, Original_Product, Trial_Type, BC,
    SOT_Days_Bucketed AS SOT_Days,
    COUNT(DISTINCT Updated_Cust_ID) AS SOT_Users
  FROM src
  WHERE SOT_Days_Bucketed IS NOT NULL
  GROUP BY App_Name, Original_Product, Trial_Type, BC, SOT_Days_Bucketed
),
cohort_totals AS (
  SELECT
    t.App_Name,
    COALESCE(p.Updated_Concat, t.Original_Product) AS Product_Name_Final,
    t.Trial_Type,
    t.BC,
    SUM(t.Total_Users) AS Total_Users
  FROM totals_per_original t
  LEFT JOIN `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name` p
    ON t.Original_Product = p.Concat
  GROUP BY 1, 2, 3, 4
),
delay_distribution AS (
  SELECT
    d.App_Name,
    COALESCE(p.Updated_Concat, d.Original_Product) AS Product_Name_Final,
    d.Trial_Type,
    d.BC,
    d.SOT_Days,
    SUM(d.SOT_Users) AS SOT_Users
  FROM delay_per_original d
  LEFT JOIN `variant-finance-data-project.Sticky_Data.R100_BQ_Updated_Product_Name` p
    ON d.Original_Product = p.Concat
  GROUP BY 1, 2, 3, 4, 5
),
sot_day_series AS (
  SELECT day AS SOT_Days FROM UNNEST(GENERATE_ARRAY(0, 30)) AS day
),
non_entry_grid AS (
  SELECT
    t.App_Name, t.Product_Name_Final, t.BC,
    s.SOT_Days,
    SUM(t.Total_Users) AS Total_Users,
    SUM(IFNULL(d.SOT_Users, 0)) AS SOT_Users
  FROM cohort_totals t
  CROSS JOIN sot_day_series s
  LEFT JOIN delay_distribution d
    ON  t.App_Name           = d.App_Name
    AND t.Product_Name_Final = d.Product_Name_Final
    AND t.Trial_Type         = d.Trial_Type
    AND t.BC                 = d.BC
    AND s.SOT_Days           = d.SOT_Days
  WHERE NOT (
       (t.Trial_Type = 'NT' AND t.BC = 1)
    OR (t.Trial_Type != 'NT' AND t.BC = 0)
  )
  GROUP BY 1, 2, 3, 4
),
entry_grid AS (
  SELECT
    t.App_Name, t.Product_Name_Final, t.BC,
    0 AS SOT_Days,
    SUM(t.Total_Users) AS Total_Users,
    SUM(t.Total_Users) AS SOT_Users
  FROM cohort_totals t
  WHERE (t.Trial_Type = 'NT'  AND t.BC = 1)
     OR (t.Trial_Type != 'NT' AND t.BC = 0)
  GROUP BY 1, 2, 3, 4
),
combined AS (
  SELECT * FROM non_entry_grid
  UNION ALL
  SELECT * FROM entry_grid
)
SELECT
  App_Name,
  Product_Name_Final,
  BC AS Billing_Cycle,
  SOT_Days,
  Total_Users,
  SOT_Users,
  ROUND(SAFE_DIVIDE(SOT_Users, Total_Users), 4) AS SOT_Ratio,
  SUM(SOT_Users) OVER (
    PARTITION BY App_Name, Product_Name_Final, BC
  ) = Total_Users AS Checkpoint_Match
FROM combined
ORDER BY App_Name, Product_Name_Final, Billing_Cycle, SOT_Days;
