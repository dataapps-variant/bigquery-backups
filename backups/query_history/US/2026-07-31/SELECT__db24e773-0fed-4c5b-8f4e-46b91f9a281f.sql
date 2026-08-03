-- job_id: db24e773-0fed-4c5b-8f4e-46b91f9a281f
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:00:19.883000+00:00
-- started: 2026-07-31T12:00:20.177000+00:00
-- ended: 2026-07-31T12:00:22.871000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
