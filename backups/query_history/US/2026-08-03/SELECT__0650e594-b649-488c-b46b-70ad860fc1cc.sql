-- job_id: 0650e594-b649-488c-b46b-70ad860fc1cc
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:19.093000+00:00
-- started: 2026-08-03T12:27:19.162000+00:00
-- ended: 2026-08-03T12:27:19.361000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'MB2788YT' AND App_Name = 'MB'
            ORDER BY Billing_Cycle, SOT_Days
