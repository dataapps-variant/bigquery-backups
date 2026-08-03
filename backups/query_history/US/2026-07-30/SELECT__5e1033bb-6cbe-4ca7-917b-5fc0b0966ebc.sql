-- job_id: 5e1033bb-6cbe-4ca7-917b-5fc0b0966ebc
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:00:15.690000+00:00
-- started: 2026-07-30T12:00:15.972000+00:00
-- ended: 2026-07-30T12:00:16.952000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_AT`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
