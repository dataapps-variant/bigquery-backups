-- job_id: ddc64200-ecbe-4077-94fd-e31ccfd3059b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:24.352000+00:00
-- started: 2026-08-03T12:22:24.446000+00:00
-- ended: 2026-08-03T12:22:24.524000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD1000AE' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
