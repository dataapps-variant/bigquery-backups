-- job_id: 850e1c4e-0bb5-4ed0-9c41-9b9dc9664fab
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:43.368000+00:00
-- started: 2026-07-28T10:01:43.456000+00:00
-- ended: 2026-07-28T10:01:43.761000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'EN2788YT' AND App_Name = 'EN'
            ORDER BY Billing_Cycle, SOT_Days
