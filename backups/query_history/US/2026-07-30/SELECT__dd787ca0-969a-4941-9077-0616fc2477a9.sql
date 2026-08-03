-- job_id: dd787ca0-969a-4941-9077-0616fc2477a9
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:00:19.813000+00:00
-- started: 2026-07-30T12:00:20.063000+00:00
-- ended: 2026-07-30T12:00:20.777000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
