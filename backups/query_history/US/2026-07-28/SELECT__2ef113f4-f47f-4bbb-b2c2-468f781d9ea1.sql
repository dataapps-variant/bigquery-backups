-- job_id: 2ef113f4-f47f-4bbb-b2c2-468f781d9ea1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:14.796000+00:00
-- started: 2026-07-28T14:34:14.917000+00:00
-- ended: 2026-07-28T14:34:15.106000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT1792YT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
