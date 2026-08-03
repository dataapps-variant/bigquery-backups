-- job_id: adf075eb-cdd9-42d2-82c9-6f4c580012a7
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:00:20.976000+00:00
-- started: 2026-08-03T12:00:21.160000+00:00
-- ended: 2026-08-03T12:00:22.570000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
