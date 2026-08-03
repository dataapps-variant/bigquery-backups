-- job_id: 7376e26a-03ee-493a-84bf-3f5c1801e5af
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:59:48.063000+00:00
-- started: 2026-07-28T09:59:48.192000+00:00
-- ended: 2026-07-28T09:59:48.378000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD2595ST' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
