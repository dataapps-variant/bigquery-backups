-- job_id: ecf95243-7344-423b-844e-43da1683764c
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:00:17.948000+00:00
-- started: 2026-08-01T12:00:18.167000+00:00
-- ended: 2026-08-01T12:00:19.033000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
