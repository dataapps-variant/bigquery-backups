-- job_id: scheduled_query_6a9ef90d-0000-274e-a79b-14223bc5fb3e
-- user: dataapps@variant.net
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-08-01T07:05:02.919000+00:00
-- started: 2026-08-01T07:05:03.244000+00:00
-- ended: 2026-08-01T07:05:04.302000+00:00

CREATE OR REPLACE TABLE `VPU_Merged.Active_Plans_6M` AS
SELECT 
    App_Name,
    CASE 
        WHEN App_Name LIKE '%JP%' AND App_Name NOT LIKE '%Non-JP%' 
        THEN CONCAT('JP_', Product_Name_Final_Merged)
        ELSE Product_Name_Final_Merged
    END AS Product_Name_Final,
    MIN(Date) AS Start_Date,
    MAX(Date) AS End_Date,
    SUM(allocated_spend) AS Spend
FROM 
    `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
WHERE 
    Date BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 2 MONTH) AND CURRENT_DATE()
    AND App_Name IS NOT NULL
    AND Product_Name_Final_Merged IS NOT NULL
GROUP BY 
    App_Name,
    Product_Name_Final_Merged
HAVING 
    SUM(allocated_spend) > 100
ORDER BY 
    Spend DESC;
