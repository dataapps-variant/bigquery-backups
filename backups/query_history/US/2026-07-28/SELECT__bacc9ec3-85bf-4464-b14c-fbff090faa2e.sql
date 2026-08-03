-- job_id: bacc9ec3-85bf-4464-b14c-fbff090faa2e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:11.483000+00:00
-- started: 2026-07-28T10:05:11.519000+00:00
-- ended: 2026-07-28T10:05:11.623000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'RT2995ST' AND App_Name = 'RT'
            ORDER BY Billing_Cycle, SOT_Days
