-- job_id: 7d1246ec-bc2c-4459-b3f7-56ba7af60627
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:29:57.615000+00:00
-- started: 2026-07-28T14:29:57.722000+00:00
-- ended: 2026-07-28T14:29:57.908000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'PD1000AE' AND App_Name = 'PD'
            ORDER BY Billing_Cycle, SOT_Days
