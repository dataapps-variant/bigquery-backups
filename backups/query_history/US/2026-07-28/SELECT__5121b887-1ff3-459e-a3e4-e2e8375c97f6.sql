-- job_id: 5121b887-1ff3-459e-a3e4-e2e8375c97f6
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:41.710000+00:00
-- started: 2026-07-28T14:31:41.781000+00:00
-- ended: 2026-07-28T14:31:41.954000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2995MT' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
