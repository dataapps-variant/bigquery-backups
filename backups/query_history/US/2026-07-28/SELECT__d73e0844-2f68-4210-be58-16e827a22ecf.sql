-- job_id: d73e0844-2f68-4210-be58-16e827a22ecf
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:44.788000+00:00
-- started: 2026-07-28T10:03:44.863000+00:00
-- ended: 2026-07-28T10:03:45.016000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CT6373YT' AND App_Name = 'CT-JP'
            ORDER BY Billing_Cycle, SOT_Days
