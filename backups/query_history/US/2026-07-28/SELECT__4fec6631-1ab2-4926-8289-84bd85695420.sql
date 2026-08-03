-- job_id: 4fec6631-1ab2-4926-8289-84bd85695420
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:37.462000+00:00
-- started: 2026-07-28T14:31:37.561000+00:00
-- ended: 2026-07-28T14:31:37.663000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2788ST' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
