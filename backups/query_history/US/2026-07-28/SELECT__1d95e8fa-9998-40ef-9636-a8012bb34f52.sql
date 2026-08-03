-- job_id: 1d95e8fa-9998-40ef-9636-a8012bb34f52
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:52.142000+00:00
-- started: 2026-07-28T10:06:52.203000+00:00
-- ended: 2026-07-28T10:06:52.292000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF2788ST' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
