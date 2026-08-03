-- job_id: 87c5a821-627c-4846-99a1-8cb6462a91cf
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:37.758000+00:00
-- started: 2026-07-28T10:03:38.072000+00:00
-- ended: 2026-07-28T10:03:38.168000+00:00


            SELECT Billing_Cycle, SOT_Days, SOT_Ratio, Total_Users
            FROM `variant-finance-data-project.R100.R100_Shape_of_tale`
            WHERE Product_Name_Final = 'CN3999ST' AND App_Name = 'CN'
            ORDER BY Billing_Cycle, SOT_Days
