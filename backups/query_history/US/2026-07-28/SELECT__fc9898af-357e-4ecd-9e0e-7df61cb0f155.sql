-- job_id: fc9898af-357e-4ecd-9e0e-7df61cb0f155
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:49.947000+00:00
-- started: 2026-07-28T14:34:50.013000+00:00
-- ended: 2026-07-28T14:34:50.186000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'MB3983YT' AND App_Name = 'MB'
            ORDER BY Billing_Cycle, SOT_Days
