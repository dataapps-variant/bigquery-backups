-- job_id: d3f43e65-7a6c-4964-af13-bfa1ef2e3480
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:08.747000+00:00
-- started: 2026-07-28T10:06:08.840000+00:00
-- ended: 2026-07-28T10:06:08.931000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT1792YT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
