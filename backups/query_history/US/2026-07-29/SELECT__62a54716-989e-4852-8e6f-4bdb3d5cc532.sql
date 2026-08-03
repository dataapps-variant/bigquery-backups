-- job_id: 62a54716-989e-4852-8e6f-4bdb3d5cc532
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:00:20.390000+00:00
-- started: 2026-07-29T12:00:20.669000+00:00
-- ended: 2026-07-29T12:00:21.435000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
