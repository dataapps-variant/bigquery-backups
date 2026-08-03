-- job_id: 41cd5e25-e5c8-49f9-954f-467fa1146d24
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:45.855000+00:00
-- started: 2026-07-28T10:02:45.906000+00:00
-- ended: 2026-07-28T10:02:46.044000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CV2688ST' AND App_Name = 'CV'
            ORDER BY Billing_Cycle, SOT_Days
