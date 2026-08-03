-- job_id: a647be67-edc1-4828-bc35-d9413e0372f1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:44.420000+00:00
-- started: 2026-07-28T10:04:44.516000+00:00
-- ended: 2026-07-28T10:04:44.615000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS0995NT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
