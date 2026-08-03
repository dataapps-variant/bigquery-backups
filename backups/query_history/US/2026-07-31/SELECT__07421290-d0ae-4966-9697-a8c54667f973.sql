-- job_id: 07421290-d0ae-4966-9697-a8c54667f973
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:00:26.570000+00:00
-- started: 2026-07-31T12:00:26.862000+00:00
-- ended: 2026-07-31T12:00:27.737000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
