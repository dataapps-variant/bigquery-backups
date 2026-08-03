-- job_id: d3da5916-269b-4a2a-9e4f-20c6a9270cfc
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:00:18.983000+00:00
-- started: 2026-08-03T12:00:19.260000+00:00
-- ended: 2026-08-03T12:00:20.293000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_AT`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
