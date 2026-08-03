-- job_id: 3a8074f5-6965-4783-99bc-1997dd3efef0
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:29.054000+00:00
-- started: 2026-07-28T14:31:29.166000+00:00
-- ended: 2026-07-28T14:31:29.250000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CL2788ST' AND App_Name = 'CL'
            ORDER BY Billing_Cycle, SOT_Days
