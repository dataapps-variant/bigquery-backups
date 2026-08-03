-- job_id: b2b95364-ae13-40bb-8a75-c4500ed9a687
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:00:28.327000+00:00
-- started: 2026-08-03T12:00:28.586000+00:00
-- ended: 2026-08-03T12:00:29.421000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
