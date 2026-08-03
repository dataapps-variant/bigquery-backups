-- job_id: 1ce130c2-a01b-48ed-9981-704fb01abeec
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:45.919000+00:00
-- started: 2026-07-28T10:02:45.998000+00:00
-- ended: 2026-07-28T10:02:46.121000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD1440AD' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
