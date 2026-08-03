-- job_id: 628299e6-f576-48ab-84a2-093113606b3a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:05.472000+00:00
-- started: 2026-08-03T12:27:05.557000+00:00
-- ended: 2026-08-03T12:27:05.752000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT2788MT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
