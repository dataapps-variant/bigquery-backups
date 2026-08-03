-- job_id: fac07e84-c6c2-4f80-a85b-b4966de55e8b
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:00:22.073000+00:00
-- started: 2026-07-29T12:00:22.358000+00:00
-- ended: 2026-07-29T12:00:23.814000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
