-- job_id: bd4bdc67-b4e9-4c5a-8432-9d4c4bf60c60
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:16.286000+00:00
-- started: 2026-07-28T10:06:16.353000+00:00
-- ended: 2026-07-28T10:06:16.457000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT2788MT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
