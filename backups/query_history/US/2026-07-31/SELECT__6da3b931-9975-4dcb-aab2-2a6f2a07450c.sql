-- job_id: 6da3b931-9975-4dcb-aab2-2a6f2a07450c
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:00:15.321000+00:00
-- started: 2026-07-31T12:00:15.693000+00:00
-- ended: 2026-07-31T12:00:16.867000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_AT`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
