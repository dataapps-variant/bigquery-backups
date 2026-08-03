-- job_id: 4f686f87-0076-4fbb-89b0-1bd4aa2fd6ab
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:35:21.300000+00:00
-- started: 2026-07-28T14:35:21.351000+00:00
-- ended: 2026-07-28T14:35:21.538000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF2788ST' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
