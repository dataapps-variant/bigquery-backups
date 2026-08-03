-- job_id: 4cc462ce-4191-4393-925d-b2b8702a07a4
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:39.737000+00:00
-- started: 2026-07-28T10:02:39.825000+00:00
-- ended: 2026-07-28T10:02:40.096000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CV1988ST' AND App_Name = 'CV'
            ORDER BY Billing_Cycle, SOT_Days
