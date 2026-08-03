-- job_id: 2afe2cc7-f1ea-4533-9e08-31f01c77626d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:00.465000+00:00
-- started: 2026-07-28T14:33:00.519000+00:00
-- ended: 2026-07-28T14:33:01.345000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'RT2788ST' AND App_Name = 'RT'
            ORDER BY Billing_Cycle, SOT_Days
