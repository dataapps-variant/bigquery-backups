-- job_id: 86868687-5d8f-4987-994d-1535a7bd2865
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:02.401000+00:00
-- started: 2026-07-28T14:31:02.468000+00:00
-- ended: 2026-07-28T14:31:02.720000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CN3400ST' AND App_Name = 'CN'
            ORDER BY Billing_Cycle, SOT_Days
