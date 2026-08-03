-- job_id: 1b8b0358-d6fd-434e-95f3-3fd421419726
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:00:24.504000+00:00
-- started: 2026-07-29T12:00:24.747000+00:00
-- ended: 2026-07-29T12:00:25.537000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
