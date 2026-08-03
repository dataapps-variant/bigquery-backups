-- job_id: dc789611-6cce-454b-aeb4-fd57f7fa64c4
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:50.342000+00:00
-- started: 2026-07-28T10:04:50.415000+00:00
-- ended: 2026-07-28T10:04:50.518000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS1995NT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
