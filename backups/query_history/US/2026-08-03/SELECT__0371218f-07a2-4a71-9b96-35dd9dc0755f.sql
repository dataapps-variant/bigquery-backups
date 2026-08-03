-- job_id: 0371218f-07a2-4a71-9b96-35dd9dc0755f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:26.162000+00:00
-- started: 2026-08-03T12:23:26.272000+00:00
-- ended: 2026-08-03T12:23:26.495000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CN3400ST' AND App_Name = 'CN'
            ORDER BY Billing_Cycle, SOT_Days
