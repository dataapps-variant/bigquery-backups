-- job_id: 2cac20ea-f92b-4f5b-945c-4d89a21cc34c
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T12:00:14.386000+00:00
-- started: 2026-08-02T12:00:14.658000+00:00
-- ended: 2026-08-02T12:00:15.567000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_AT`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
