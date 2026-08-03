-- job_id: 27769092-ba74-4aab-aded-5333d6fe26ad
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:19.429000+00:00
-- started: 2026-08-03T12:25:19.496000+00:00
-- ended: 2026-08-03T12:25:19.647000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CV2688ST' AND App_Name = 'CV'
            ORDER BY Billing_Cycle, SOT_Days
