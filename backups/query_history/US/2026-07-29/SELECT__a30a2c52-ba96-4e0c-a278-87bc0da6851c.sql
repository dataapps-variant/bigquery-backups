-- job_id: a30a2c52-ba96-4e0c-a278-87bc0da6851c
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:00:18.587000+00:00
-- started: 2026-07-29T12:00:18.761000+00:00
-- ended: 2026-07-29T12:00:19.652000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
