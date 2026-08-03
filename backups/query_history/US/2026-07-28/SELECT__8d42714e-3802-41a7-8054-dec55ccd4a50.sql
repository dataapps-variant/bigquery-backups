-- job_id: 8d42714e-3802-41a7-8054-dec55ccd4a50
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:32.060000+00:00
-- started: 2026-07-28T14:32:32.122000+00:00
-- ended: 2026-07-28T14:32:32.313000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS1995NT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
