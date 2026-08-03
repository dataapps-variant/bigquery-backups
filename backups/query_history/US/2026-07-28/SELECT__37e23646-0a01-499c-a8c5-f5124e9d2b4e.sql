-- job_id: 37e23646-0a01-499c-a8c5-f5124e9d2b4e
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:00:16.864000+00:00
-- started: 2026-07-28T12:00:17.076000+00:00
-- ended: 2026-07-28T12:00:17.862000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
