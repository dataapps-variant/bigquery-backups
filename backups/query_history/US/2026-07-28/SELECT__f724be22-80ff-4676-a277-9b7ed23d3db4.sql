-- job_id: f724be22-80ff-4676-a277-9b7ed23d3db4
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:23.194000+00:00
-- started: 2026-07-28T10:04:23.303000+00:00
-- ended: 2026-07-28T10:04:23.424000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS2788NT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
