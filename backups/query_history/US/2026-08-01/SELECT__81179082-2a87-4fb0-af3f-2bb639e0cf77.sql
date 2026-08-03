-- job_id: 81179082-2a87-4fb0-af3f-2bb639e0cf77
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:00:25.117000+00:00
-- started: 2026-08-01T12:00:25.212000+00:00
-- ended: 2026-08-01T12:00:26.787000+00:00


    SELECT App_Name, Customer_Number, Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    GROUP BY App_Name, Customer_Number, Order_Id
    HAVING COUNT(1) > 1;
