-- job_id: 612b69a2-3607-4b7c-b2af-5a3c5966283b
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:00:19.730000+00:00
-- started: 2026-08-01T12:00:20.165000+00:00
-- ended: 2026-08-01T12:00:20.890000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
