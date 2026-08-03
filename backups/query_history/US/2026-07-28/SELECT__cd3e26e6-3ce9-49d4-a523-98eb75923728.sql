-- job_id: cd3e26e6-3ce9-49d4-a523-98eb75923728
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:03.307000+00:00
-- started: 2026-07-28T10:05:03.367000+00:00
-- ended: 2026-07-28T10:05:03.874000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF4995ST' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
