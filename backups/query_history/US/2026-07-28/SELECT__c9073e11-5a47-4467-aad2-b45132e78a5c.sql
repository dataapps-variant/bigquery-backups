-- job_id: c9073e11-5a47-4467-aad2-b45132e78a5c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:19.628000+00:00
-- started: 2026-07-28T10:01:19.703000+00:00
-- ended: 2026-07-28T10:01:19.870000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2995ST' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
