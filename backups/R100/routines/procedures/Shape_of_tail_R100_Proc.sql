CREATE PROCEDURE `variant-finance-data-project`.R100.Shape_of_tail_R100_Proc()
BEGIN
CREATE OR REPLACE TABLE `variant-finance-data-project.demo_practise.Shape of Tail_R100` AS
WITH bc_plan_total AS (
  SELECT
    App_Name,
    Product_Name_Final,
    CAST(Billing_Cycle AS INT64) AS BC,
    COUNT(DISTINCT Updated_Cust_ID) AS Total_Users
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Date_of_Sale >= DATE_SUB(CURRENT_DATE(), INTERVAL 100 DAY)
    AND Date_of_Sale <= DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
    AND App_Name IS NOT NULL
    AND Product_Name_Final IS NOT NULL
    AND Billing_Cycle IS NOT NULL
    AND CAST(Billing_Cycle AS INT64) BETWEEN 0 AND 36
  GROUP BY App_Name, Product_Name_Final, BC
),
bc_plan_delay_users AS (
  SELECT
    App_Name,
    Product_Name_Final,
    CAST(Billing_Cycle AS INT64) AS BC,
    CAST(Delay_days_SOT AS INT64) AS SOT_Days,
    COUNT(DISTINCT Updated_Cust_ID) AS SOT_Users
  FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
  WHERE Date_of_Sale >= DATE_SUB(CURRENT_DATE(), INTERVAL 100 DAY)
    AND Date_of_Sale <= DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY)
    AND App_Name IS NOT NULL
    AND Product_Name_Final IS NOT NULL
    AND Billing_Cycle IS NOT NULL
    AND CAST(Billing_Cycle AS INT64) BETWEEN 0 AND 36
    AND Delay_days_SOT IS NOT NULL
    AND CAST(Delay_days_SOT AS INT64) BETWEEN 0 AND 30
  GROUP BY App_Name, Product_Name_Final, BC, SOT_Days
),
sot_day_series AS (
  SELECT day AS SOT_Days
  FROM UNNEST(GENERATE_ARRAY(0, 30)) AS day
)
SELECT
  t.App_Name,
  t.Product_Name_Final,
  t.BC AS Billing_Cycle,
  s.SOT_Days,
  t.Total_Users,
  IFNULL(d.SOT_Users, 0) AS SOT_Users,
  ROUND(SAFE_DIVIDE(IFNULL(d.SOT_Users, 0), t.Total_Users), 4) AS SOT_Ratio
FROM bc_plan_total t
CROSS JOIN sot_day_series s
LEFT JOIN bc_plan_delay_users d
  ON t.App_Name = d.App_Name
  AND t.Product_Name_Final = d.Product_Name_Final
  AND t.BC = d.BC
  AND s.SOT_Days = d.SOT_Days
ORDER BY t.App_Name ASC, t.Product_Name_Final ASC, t.BC ASC, s.SOT_Days ASC;
END;
