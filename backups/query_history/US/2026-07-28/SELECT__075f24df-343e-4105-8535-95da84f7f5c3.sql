-- job_id: 075f24df-343e-4105-8535-95da84f7f5c3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:46.143000+00:00
-- started: 2026-07-28T10:00:46.202000+00:00
-- ended: 2026-07-28T10:00:46.412000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'AT1495NT' AND App_Name = 'AT'
            ORDER BY Billing_Cycle, SOT_Days
