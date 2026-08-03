-- job_id: 5b5fca48-54e8-42cb-8239-7ff34bd9d245
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:58.601000+00:00
-- started: 2026-07-28T14:34:58.687000+00:00
-- ended: 2026-07-28T14:34:58.856000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF8970ST' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
