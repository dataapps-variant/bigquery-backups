-- job_id: 3f70eeb2-cd29-4a34-b38d-0a91b5d73c4f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:52.357000+00:00
-- started: 2026-08-03T12:26:52.427000+00:00
-- ended: 2026-08-03T12:26:52.599000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT1792YT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
