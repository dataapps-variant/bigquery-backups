-- job_id: da078fc1-395a-4b44-b7a8-dd5f860ed964
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:53.457000+00:00
-- started: 2026-07-28T10:02:53.521000+00:00
-- ended: 2026-07-28T10:02:53.678000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'IQ2788YT' AND App_Name = 'IQ'
            ORDER BY Billing_Cycle, SOT_Days
