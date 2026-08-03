-- job_id: 5fa1bb5a-fbce-499f-982a-2bb19f5f8680
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:03.455000+00:00
-- started: 2026-07-28T10:03:03.523000+00:00
-- ended: 2026-07-28T10:03:03.829000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'RT2995ST' AND App_Name = 'RT'
            ORDER BY Billing_Cycle, SOT_Days
