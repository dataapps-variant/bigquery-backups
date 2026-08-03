-- job_id: 400a3df9-dd46-4156-9a13-8b3439292e9d
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:00:23.253000+00:00
-- started: 2026-08-03T12:00:23.464000+00:00
-- ended: 2026-08-03T12:00:24.373000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
