-- job_id: script_job_0cfc59a055e44c1f57a8e65026a8bdea_0
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: CREATE_TABLE_AS_SELECT
-- created: 2026-07-29T08:44:00.905000+00:00
-- started: 2026-07-29T08:44:01.440000+00:00
-- ended: 2026-07-29T08:44:08.847000+00:00

CREATE OR REPLACE TABLE `ICARUS_Multi.Active_Plans_6M` AS
SELECT 
    App_Name,
    Product_Name_Final_Merged AS Product_Name_Final,
    MIN(Date) AS Start_Date,
    MAX(Date) AS End_Date,
    SUM(allocated_spend) AS Spend
FROM 
    `variant-finance-data-project.Ad_spend_data.Merged_Spend_Split_TBL`
WHERE 
    Date BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH) AND CURRENT_DATE()
    AND App_Name IS NOT NULL
    AND Product_Name_Final_Merged IS NOT NULL
GROUP BY 
    App_Name,
    Product_Name_Final_Merged
HAVING 
    SUM(allocated_spend) > 100
ORDER BY 
    Spend DESC
