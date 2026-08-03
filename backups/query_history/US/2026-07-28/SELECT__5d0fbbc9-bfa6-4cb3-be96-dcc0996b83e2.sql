-- job_id: 5d0fbbc9-bfa6-4cb3-be96-dcc0996b83e2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:49.551000+00:00
-- started: 2026-07-28T10:02:49.640000+00:00
-- ended: 2026-07-28T10:02:49.785000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CV2995ST' AND App_Name = 'CV'
            ORDER BY Billing_Cycle, SOT_Days
