-- job_id: 878a2d39-0947-4328-bb7f-19ee41be38d7
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:41.066000+00:00
-- started: 2026-07-28T14:32:41.146000+00:00
-- ended: 2026-07-28T14:32:41.356000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CV1988ST' AND App_Name = 'CV'
            ORDER BY Billing_Cycle, SOT_Days
