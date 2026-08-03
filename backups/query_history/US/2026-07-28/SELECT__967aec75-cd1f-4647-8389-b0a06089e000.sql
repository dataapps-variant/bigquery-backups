-- job_id: 967aec75-cd1f-4647-8389-b0a06089e000
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:29:51.155000+00:00
-- started: 2026-07-28T14:29:51.256000+00:00
-- ended: 2026-07-28T14:29:51.463000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD2595ST' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
