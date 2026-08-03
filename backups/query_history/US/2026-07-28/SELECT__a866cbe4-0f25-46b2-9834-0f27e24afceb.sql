-- job_id: a866cbe4-0f25-46b2-9834-0f27e24afceb
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:59.155000+00:00
-- started: 2026-07-28T10:04:59.222000+00:00
-- ended: 2026-07-28T10:04:59.303000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CV2688ST' AND App_Name = 'CV'
            ORDER BY Billing_Cycle, SOT_Days
