-- job_id: 31881a6d-6c56-490d-a539-4e611be9be9e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:51.586000+00:00
-- started: 2026-07-28T14:32:51.663000+00:00
-- ended: 2026-07-28T14:32:51.815000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CV2995ST' AND App_Name = 'CV'
            ORDER BY Billing_Cycle, SOT_Days
