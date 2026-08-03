-- job_id: 02b70a05-e4f6-49bf-847b-410cd2122d8a
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:00:20.427000+00:00
-- started: 2026-07-28T12:00:20.667000+00:00
-- ended: 2026-07-28T12:00:21.890000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
