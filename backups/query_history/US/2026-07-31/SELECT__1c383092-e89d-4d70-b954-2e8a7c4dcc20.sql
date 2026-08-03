-- job_id: 1c383092-e89d-4d70-b954-2e8a7c4dcc20
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:00:17.890000+00:00
-- started: 2026-07-31T12:00:18.160000+00:00
-- ended: 2026-07-31T12:00:19.254000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
