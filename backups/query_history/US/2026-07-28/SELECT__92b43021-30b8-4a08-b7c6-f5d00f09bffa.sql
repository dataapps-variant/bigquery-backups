-- job_id: 92b43021-30b8-4a08-b7c6-f5d00f09bffa
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:18.411000+00:00
-- started: 2026-07-28T14:30:18.483000+00:00
-- ended: 2026-07-28T14:30:18.699000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD9600AD' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
