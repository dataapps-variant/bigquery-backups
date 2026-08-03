-- job_id: d68686fb-9d86-46f1-90cc-44bdb5287aba
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:58.739000+00:00
-- started: 2026-07-28T10:02:58.802000+00:00
-- ended: 2026-07-28T10:02:58.986000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'RT2788ST' AND App_Name = 'RT'
            ORDER BY Billing_Cycle, SOT_Days
