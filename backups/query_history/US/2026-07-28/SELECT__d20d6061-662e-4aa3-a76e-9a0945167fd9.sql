-- job_id: d20d6061-662e-4aa3-a76e-9a0945167fd9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:37.530000+00:00
-- started: 2026-07-28T10:06:37.580000+00:00
-- ended: 2026-07-28T10:06:37.674000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF8970ST' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
