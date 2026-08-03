-- job_id: 99939905-ea95-4bb8-b281-da24be34e001
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:10.679000+00:00
-- started: 2026-07-28T10:02:10.775000+00:00
-- ended: 2026-07-28T10:02:11.004000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS0995YT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
