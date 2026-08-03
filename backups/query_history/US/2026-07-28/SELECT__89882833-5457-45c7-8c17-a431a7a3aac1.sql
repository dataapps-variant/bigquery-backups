-- job_id: 89882833-5457-45c7-8c17-a431a7a3aac1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:32.731000+00:00
-- started: 2026-07-28T10:03:32.808000+00:00
-- ended: 2026-07-28T10:03:32.963000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CN3400ST' AND App_Name = 'CN'
            ORDER BY Billing_Cycle, SOT_Days
