-- job_id: 1be12d61-5efe-49a7-bd85-b1481a24caf4
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:39.242000+00:00
-- started: 2026-07-28T10:05:39.300000+00:00
-- ended: 2026-07-28T10:05:39.405000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT3784YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
