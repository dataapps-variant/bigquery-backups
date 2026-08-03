-- job_id: a9763d12-6276-420e-9b0a-89a4acad9fd0
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:26.549000+00:00
-- started: 2026-07-28T14:34:26.606000+00:00
-- ended: 2026-07-28T14:34:27.114000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT2788MT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
