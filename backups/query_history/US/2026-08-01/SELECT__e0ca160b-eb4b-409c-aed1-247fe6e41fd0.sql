-- job_id: e0ca160b-eb4b-409c-aed1-247fe6e41fd0
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:00:23.744000+00:00
-- started: 2026-08-01T12:00:23.965000+00:00
-- ended: 2026-08-01T12:00:24.570000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
