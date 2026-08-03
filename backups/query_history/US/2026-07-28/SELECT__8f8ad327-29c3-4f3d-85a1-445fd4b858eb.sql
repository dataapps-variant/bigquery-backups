-- job_id: 8f8ad327-29c3-4f3d-85a1-445fd4b858eb
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:59:57.260000+00:00
-- started: 2026-07-28T09:59:57.315000+00:00
-- ended: 2026-07-28T09:59:57.399000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD1000AE' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
