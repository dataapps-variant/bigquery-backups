-- job_id: 06803194-7130-4610-900d-c234881d16b9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:03.529000+00:00
-- started: 2026-07-28T10:01:03.610000+00:00
-- ended: 2026-07-28T10:01:03.785000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CN3999ST' AND App_Name = 'CN'
            ORDER BY Billing_Cycle, SOT_Days
