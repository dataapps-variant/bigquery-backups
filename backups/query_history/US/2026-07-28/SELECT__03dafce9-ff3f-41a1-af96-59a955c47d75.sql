-- job_id: 03dafce9-ff3f-41a1-af96-59a955c47d75
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:33.981000+00:00
-- started: 2026-07-28T14:34:34.046000+00:00
-- ended: 2026-07-28T14:34:34.235000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT3784YT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
