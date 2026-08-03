-- job_id: de805aa1-ebca-4081-b4de-01ff8f4dbcea
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:08.993000+00:00
-- started: 2026-08-03T12:25:09.096000+00:00
-- ended: 2026-08-03T12:25:09.311000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CV2788ST' AND App_Name = 'CV'
            ORDER BY Billing_Cycle, SOT_Days
