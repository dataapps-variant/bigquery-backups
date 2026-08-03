-- job_id: 4b90cba0-6536-4e3c-9371-5d55ad084739
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:12.042000+00:00
-- started: 2026-07-28T14:31:12.134000+00:00
-- ended: 2026-07-28T14:31:12.320000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2788ST' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
