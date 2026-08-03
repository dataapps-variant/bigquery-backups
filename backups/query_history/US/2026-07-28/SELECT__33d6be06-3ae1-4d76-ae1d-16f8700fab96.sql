-- job_id: 33d6be06-3ae1-4d76-ae1d-16f8700fab96
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:00:18.566000+00:00
-- started: 2026-07-28T12:00:19.028000+00:00
-- ended: 2026-07-28T12:00:19.727000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
