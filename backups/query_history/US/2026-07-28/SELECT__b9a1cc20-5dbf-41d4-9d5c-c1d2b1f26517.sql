-- job_id: b9a1cc20-5dbf-41d4-9d5c-c1d2b1f26517
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:22.740000+00:00
-- started: 2026-07-28T14:34:22.805000+00:00
-- ended: 2026-07-28T14:34:22.982000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT4588YT' AND App_Name = 'CT-Non-JP'
            ORDER BY Billing_Cycle, SOT_Days
