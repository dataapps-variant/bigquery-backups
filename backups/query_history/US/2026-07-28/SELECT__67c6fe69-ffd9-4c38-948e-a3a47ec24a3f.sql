-- job_id: 67c6fe69-ffd9-4c38-948e-a3a47ec24a3f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:41.973000+00:00
-- started: 2026-07-28T10:03:42.024000+00:00
-- ended: 2026-07-28T10:03:42.108000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2788ST' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
