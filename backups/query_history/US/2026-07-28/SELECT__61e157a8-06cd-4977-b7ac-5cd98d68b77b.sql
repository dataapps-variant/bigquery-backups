-- job_id: 61e157a8-06cd-4977-b7ac-5cd98d68b77b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:03.758000+00:00
-- started: 2026-07-28T10:05:03.834000+00:00
-- ended: 2026-07-28T10:05:03.910000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'IQ2788YT' AND App_Name = 'IQ'
            ORDER BY Billing_Cycle, SOT_Days
