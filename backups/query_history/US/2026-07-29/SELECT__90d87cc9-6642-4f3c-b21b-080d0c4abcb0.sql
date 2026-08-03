-- job_id: 90d87cc9-6642-4f3c-b21b-080d0c4abcb0
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:00:16.592000+00:00
-- started: 2026-07-29T12:00:16.926000+00:00
-- ended: 2026-07-29T12:00:17.872000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_AT`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
