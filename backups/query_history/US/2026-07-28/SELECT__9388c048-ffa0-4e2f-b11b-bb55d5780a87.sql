-- job_id: 9388c048-ffa0-4e2f-b11b-bb55d5780a87
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:59:53.331000+00:00
-- started: 2026-07-28T09:59:53.451000+00:00
-- ended: 2026-07-28T09:59:53.623000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD1000AE' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
