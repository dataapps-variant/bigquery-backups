-- job_id: 8310df70-bb0c-44d2-b16f-2ffd2790bed1
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:00:14.891000+00:00
-- started: 2026-07-28T12:00:15.185000+00:00
-- ended: 2026-07-28T12:00:16.060000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_AT`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
