-- job_id: 5caf82dc-b99d-4632-941c-9630f55ddac4
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:06.742000+00:00
-- started: 2026-07-28T14:30:06.838000+00:00
-- ended: 2026-07-28T14:30:07.054000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD2995MT' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
