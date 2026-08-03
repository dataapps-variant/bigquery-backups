-- job_id: 9f63a9b5-86f3-430f-bd57-fe0aaca879d1
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T12:00:16.352000+00:00
-- started: 2026-08-02T12:00:16.664000+00:00
-- ended: 2026-08-02T12:00:17.557000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
