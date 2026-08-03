-- job_id: 5851cb62-61d4-4bf5-bd46-97cb2f1e92bc
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:42.957000+00:00
-- started: 2026-07-28T14:33:43.059000+00:00
-- ended: 2026-07-28T14:33:43.219000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT3784YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
