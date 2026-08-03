-- job_id: 1cc98a64-09cc-4f61-8fc7-81c4a2f60675
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:00:21.464000+00:00
-- started: 2026-07-30T12:00:21.769000+00:00
-- ended: 2026-07-30T12:00:22.677000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
