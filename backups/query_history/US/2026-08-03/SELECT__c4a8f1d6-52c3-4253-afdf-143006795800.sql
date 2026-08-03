-- job_id: c4a8f1d6-52c3-4253-afdf-143006795800
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:05.746000+00:00
-- started: 2026-08-03T12:26:05.824000+00:00
-- ended: 2026-08-03T12:26:06.007000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT5178YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
