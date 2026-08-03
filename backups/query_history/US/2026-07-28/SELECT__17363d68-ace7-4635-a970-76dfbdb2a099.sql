-- job_id: 17363d68-ace7-4635-a970-76dfbdb2a099
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:34.881000+00:00
-- started: 2026-07-28T10:02:34.954000+00:00
-- ended: 2026-07-28T10:02:35.394000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CV2788ST' AND App_Name = 'CV'
            ORDER BY Billing_Cycle, SOT_Days
