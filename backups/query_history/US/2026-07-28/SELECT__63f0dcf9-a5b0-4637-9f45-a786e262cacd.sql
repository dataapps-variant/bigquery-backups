-- job_id: 63f0dcf9-a5b0-4637-9f45-a786e262cacd
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:41.849000+00:00
-- started: 2026-07-28T14:34:41.940000+00:00
-- ended: 2026-07-28T14:34:42.088000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'MB6373YT' AND App_Name = 'MB'
            ORDER BY Billing_Cycle, SOT_Days
