-- job_id: 0d4e6b44-26e2-4ef1-993a-d940d3bbb0f7
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:40.600000+00:00
-- started: 2026-07-28T10:02:40.699000+00:00
-- ended: 2026-07-28T10:02:40.809000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD2995MT' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
