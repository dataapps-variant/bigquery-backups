-- job_id: 0efa5166-9e22-4ec5-930b-afa736314d85
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:21.344000+00:00
-- started: 2026-07-28T10:05:21.421000+00:00
-- ended: 2026-07-28T10:05:21.580000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF2788ST' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
