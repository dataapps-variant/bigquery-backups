-- job_id: 227dabc5-ff47-4ea6-9249-2010ce541019
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:38.627000+00:00
-- started: 2026-07-28T14:33:38.694000+00:00
-- ended: 2026-07-28T14:33:38.904000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT4780YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
