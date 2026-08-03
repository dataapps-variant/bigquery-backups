-- job_id: 63a3175c-bfbf-42f6-890a-0961c711fa0b
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T12:00:19.986000+00:00
-- started: 2026-08-02T12:00:20.366000+00:00
-- ended: 2026-08-02T12:00:21.274000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
