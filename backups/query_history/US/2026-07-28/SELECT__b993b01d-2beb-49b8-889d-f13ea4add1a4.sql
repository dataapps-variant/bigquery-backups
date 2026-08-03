-- job_id: b993b01d-2beb-49b8-889d-f13ea4add1a4
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:11.917000+00:00
-- started: 2026-07-28T10:02:12.021000+00:00
-- ended: 2026-07-28T10:02:12.129000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD4988MT' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
