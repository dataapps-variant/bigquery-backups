-- job_id: c8f4d537-e007-48ec-86f0-f1ac806768c3
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:00:23.689000+00:00
-- started: 2026-07-31T12:00:23.956000+00:00
-- ended: 2026-07-31T12:00:25.811000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
