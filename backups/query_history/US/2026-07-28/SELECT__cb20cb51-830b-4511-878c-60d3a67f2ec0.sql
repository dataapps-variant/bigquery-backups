-- job_id: cb20cb51-830b-4511-878c-60d3a67f2ec0
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:17.553000+00:00
-- started: 2026-07-28T14:32:17.640000+00:00
-- ended: 2026-07-28T14:32:17.843000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS2788YT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
