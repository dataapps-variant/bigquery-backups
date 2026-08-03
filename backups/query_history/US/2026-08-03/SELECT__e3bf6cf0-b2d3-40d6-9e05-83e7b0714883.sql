-- job_id: e3bf6cf0-b2d3-40d6-9e05-83e7b0714883
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:33.815000+00:00
-- started: 2026-08-03T12:25:33.927000+00:00
-- ended: 2026-08-03T12:25:34.128000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'RT2788ST' AND App_Name = 'RT'
            ORDER BY Billing_Cycle, SOT_Days
