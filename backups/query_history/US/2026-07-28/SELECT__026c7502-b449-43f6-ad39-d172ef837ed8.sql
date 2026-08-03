-- job_id: 026c7502-b449-43f6-ad39-d172ef837ed8
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:05.382000+00:00
-- started: 2026-07-28T10:02:05.464000+00:00
-- ended: 2026-07-28T10:02:05.803000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS1495YT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
