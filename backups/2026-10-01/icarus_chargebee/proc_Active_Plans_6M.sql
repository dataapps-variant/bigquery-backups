CREATE PROCEDURE `variant-finance-data-project`.icarus_chargebee.proc_Active_Plans_6M()
BEGIN

-- Create table: variant-finance-data-project.icarus_chargebee.Active_Plans_6M
-- Plans with > $100 spend in the last 6 months that are sold on CHARGEBEE
-- Depends on: icarus_chargebee.Plan_List (run proc_Plan_List first)

CREATE OR REPLACE TABLE `variant-finance-data-project.icarus_chargebee.Active_Plans_6M` AS

WITH Chargebee_Plans AS (
  -- One row per App + Plan (Plan_List can have several rows per plan)
  SELECT DISTINCT
      App_Name,
      Product_Name_Final
  FROM `variant-finance-data-project.icarus_chargebee.Plan_List`
)

SELECT 
    ms.App_Name,
    ms.Product_Name_Final_Merged AS Product_Name_Final,
    MIN(ms.Date) AS Start_Date,
    MAX(ms.Date) AS End_Date,
    SUM(ms.allocated_spend) AS Spend
FROM 
    `variant-finance-data-project.icarus_chargebee.Spend_Split` ms
    INNER JOIN 
    Chargebee_Plans cb
    ON  ms.App_Name = cb.App_Name
    AND ms.Product_Name_Final_Merged = cb.Product_Name_Final
WHERE 
    ms.Date BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH) AND CURRENT_DATE()
    AND ms.App_Name IS NOT NULL
    AND ms.Product_Name_Final_Merged IS NOT NULL
GROUP BY 
    ms.App_Name,
    ms.Product_Name_Final_Merged
HAVING 
    SUM(ms.allocated_spend) > 100
ORDER BY 
    Spend DESC;

END;
