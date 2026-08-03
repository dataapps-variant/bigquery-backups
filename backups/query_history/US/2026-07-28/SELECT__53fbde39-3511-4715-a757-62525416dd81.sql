-- job_id: 53fbde39-3511-4715-a757-62525416dd81
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:53.199000+00:00
-- started: 2026-07-28T10:03:53.250000+00:00
-- ended: 2026-07-28T10:03:53.348000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2995ST' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
