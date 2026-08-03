-- job_id: e852736a-1124-4095-b4a1-f4459942cc24
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:32.986000+00:00
-- started: 2026-08-03T12:23:33.090000+00:00
-- ended: 2026-08-03T12:23:33.280000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CN3999ST' AND App_Name = 'CN'
            ORDER BY Billing_Cycle, SOT_Days
