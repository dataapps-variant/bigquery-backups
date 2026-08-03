-- job_id: a425e6d6-461d-419a-9231-11e5f80da38b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:35:17.263000+00:00
-- started: 2026-07-28T14:35:17.359000+00:00
-- ended: 2026-07-28T14:35:17.526000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF5985ST' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
