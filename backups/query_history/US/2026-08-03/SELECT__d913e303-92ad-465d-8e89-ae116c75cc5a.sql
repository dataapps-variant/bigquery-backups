-- job_id: d913e303-92ad-465d-8e89-ae116c75cc5a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:53.644000+00:00
-- started: 2026-08-03T12:24:53.718000+00:00
-- ended: 2026-08-03T12:24:53.965000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS0995NT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
