-- job_id: 34388a2a-c118-4bc1-a982-b01dd8b63700
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:00:21.623000+00:00
-- started: 2026-08-01T12:00:21.873000+00:00
-- ended: 2026-08-01T12:00:23.123000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
