-- job_id: 92250d9b-5d66-496d-ad58-5dc2e3cadac7
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:00:17.803000+00:00
-- started: 2026-07-30T12:00:18.062000+00:00
-- ended: 2026-07-30T12:00:18.905000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
