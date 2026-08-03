-- job_id: 02dc05de-8fa0-4287-93f2-ffe7f29be0b1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:28.150000+00:00
-- started: 2026-08-03T12:26:28.255000+00:00
-- ended: 2026-08-03T12:26:28.434000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT2788YT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
