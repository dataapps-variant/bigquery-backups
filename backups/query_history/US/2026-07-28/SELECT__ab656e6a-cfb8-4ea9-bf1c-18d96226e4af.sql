-- job_id: ab656e6a-cfb8-4ea9-bf1c-18d96226e4af
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:30.524000+00:00
-- started: 2026-07-28T10:02:30.581000+00:00
-- ended: 2026-07-28T10:02:30.739000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'FS1995NT' AND App_Name = 'FS'
            ORDER BY Billing_Cycle, SOT_Days
