-- job_id: a03ec93d-9541-4695-a747-7d5c55cdc950
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:35:02.568000+00:00
-- started: 2026-07-28T14:35:02.686000+00:00
-- ended: 2026-07-28T14:35:02.841000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF4995ST' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
