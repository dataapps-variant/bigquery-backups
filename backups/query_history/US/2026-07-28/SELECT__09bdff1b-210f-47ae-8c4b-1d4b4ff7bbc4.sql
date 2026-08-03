-- job_id: 09bdff1b-210f-47ae-8c4b-1d4b4ff7bbc4
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:36.742000+00:00
-- started: 2026-07-28T14:32:36.812000+00:00
-- ended: 2026-07-28T14:32:37.032000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CV2788ST' AND App_Name = 'CV'
            ORDER BY Billing_Cycle, SOT_Days
