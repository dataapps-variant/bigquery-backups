-- job_id: 6116ef8d-3f37-43a9-9fbf-60670dee3a1e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:46.236000+00:00
-- started: 2026-07-28T14:34:46.329000+00:00
-- ended: 2026-07-28T14:34:46.490000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'MB5178YT' AND App_Name = 'MB'
            ORDER BY Billing_Cycle, SOT_Days
