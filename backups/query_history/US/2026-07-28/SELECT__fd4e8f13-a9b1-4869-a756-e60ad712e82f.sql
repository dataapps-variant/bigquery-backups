-- job_id: fd4e8f13-a9b1-4869-a756-e60ad712e82f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:55.174000+00:00
-- started: 2026-07-28T10:02:55.247000+00:00
-- ended: 2026-07-28T10:02:55.348000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'AT2788YT' AND App_Name = 'AT'
            ORDER BY Billing_Cycle, SOT_Days
