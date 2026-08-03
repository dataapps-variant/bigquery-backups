-- job_id: 5e379900-bdd9-4968-a293-7143211e60ad
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:54.056000+00:00
-- started: 2026-07-28T10:01:54.142000+00:00
-- ended: 2026-07-28T10:01:54.331000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS2788NT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
