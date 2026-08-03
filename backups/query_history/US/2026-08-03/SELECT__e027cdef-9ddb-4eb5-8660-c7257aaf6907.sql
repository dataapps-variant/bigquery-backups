-- job_id: e027cdef-9ddb-4eb5-8660-c7257aaf6907
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:37.974000+00:00
-- started: 2026-08-03T12:27:38.013000+00:00
-- ended: 2026-08-03T12:27:38.173000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF2995MT' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
