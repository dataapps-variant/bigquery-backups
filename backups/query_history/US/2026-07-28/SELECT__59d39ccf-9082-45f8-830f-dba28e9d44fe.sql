-- job_id: 59d39ccf-9082-45f8-830f-dba28e9d44fe
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:00:23.171000+00:00
-- started: 2026-07-28T12:00:23.358000+00:00
-- ended: 2026-07-28T12:00:24.036000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
