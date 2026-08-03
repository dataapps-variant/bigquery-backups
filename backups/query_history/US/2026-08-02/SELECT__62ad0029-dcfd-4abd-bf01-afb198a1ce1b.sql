-- job_id: 62ad0029-dcfd-4abd-bf01-afb198a1ce1b
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T12:00:18.199000+00:00
-- started: 2026-08-02T12:00:18.475000+00:00
-- ended: 2026-08-02T12:00:19.268000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
