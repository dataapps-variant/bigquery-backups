-- job_id: 34232b94-0c92-4966-9a07-eb195b55c6eb
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:45.934000+00:00
-- started: 2026-07-28T14:31:46.051000+00:00
-- ended: 2026-07-28T14:31:46.221000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'EN2788YT' AND App_Name = 'EN'
            ORDER BY Billing_Cycle, SOT_Days
