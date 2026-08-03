-- job_id: 692ef406-2f35-49e5-bc8d-31c29d4d4254
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:00:16.071000+00:00
-- started: 2026-08-01T12:00:16.389000+00:00
-- ended: 2026-08-01T12:00:17.196000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_AT`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
