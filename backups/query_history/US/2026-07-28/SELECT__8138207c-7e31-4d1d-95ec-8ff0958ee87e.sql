-- job_id: 8138207c-7e31-4d1d-95ec-8ff0958ee87e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:12.593000+00:00
-- started: 2026-07-28T14:32:12.696000+00:00
-- ended: 2026-07-28T14:32:12.890000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS0995YT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
