-- job_id: d80da56f-7231-431c-a6e6-af3f9d06e093
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:37.875000+00:00
-- started: 2026-07-28T14:34:37.926000+00:00
-- ended: 2026-07-28T14:34:38.098000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'MB2788YT' AND App_Name = 'MB'
            ORDER BY Billing_Cycle, SOT_Days
