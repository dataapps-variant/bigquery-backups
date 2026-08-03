-- job_id: 1339a2ff-0495-402a-88fa-3b836e84681e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:17.194000+00:00
-- started: 2026-07-28T10:05:17.269000+00:00
-- ended: 2026-07-28T10:05:17.418000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'JF5985ST' AND App_Name = 'JF'
            ORDER BY Billing_Cycle, SOT_Days
