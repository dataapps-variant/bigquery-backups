-- job_id: cc57e3b7-0bec-4613-b616-c7795152c567
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:56.815000+00:00
-- started: 2026-07-28T14:31:56.892000+00:00
-- ended: 2026-07-28T14:31:57.062000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS2788NT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
