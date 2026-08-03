-- job_id: 0b27ccc6-01a1-4ef0-bf84-d574c9c6a6b6
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:20.403000+00:00
-- started: 2026-07-28T10:03:20.523000+00:00
-- ended: 2026-07-28T10:03:20.647000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'AT1495NT' AND App_Name = 'AT'
            ORDER BY Billing_Cycle, SOT_Days
