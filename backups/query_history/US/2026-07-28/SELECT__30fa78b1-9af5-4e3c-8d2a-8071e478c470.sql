-- job_id: 30fa78b1-9af5-4e3c-8d2a-8071e478c470
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:35:07.100000+00:00
-- started: 2026-07-28T14:35:07.190000+00:00
-- ended: 2026-07-28T14:35:07.349000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF2995ST' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
