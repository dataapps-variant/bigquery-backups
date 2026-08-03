-- job_id: 3010eca0-3f4b-4924-ae33-7a29b819c0ac
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:33.148000+00:00
-- started: 2026-07-28T14:31:33.239000+00:00
-- ended: 2026-07-28T14:31:33.331000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2788ST' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
