-- job_id: 09729560-ab24-41b1-9017-932a46cb94ae
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T12:00:21.951000+00:00
-- started: 2026-08-02T12:00:22.162000+00:00
-- ended: 2026-08-02T12:00:22.849000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
