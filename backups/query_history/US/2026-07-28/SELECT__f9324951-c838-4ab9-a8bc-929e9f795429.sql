-- job_id: f9324951-c838-4ab9-a8bc-929e9f795429
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:30.419000+00:00
-- started: 2026-07-28T14:34:30.495000+00:00
-- ended: 2026-07-28T14:34:30.657000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT4780YT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
