-- job_id: a2b48404-387e-44c1-930f-6231355b562e
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:00:23.392000+00:00
-- started: 2026-07-30T12:00:23.652000+00:00
-- ended: 2026-07-30T12:00:24.521000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
