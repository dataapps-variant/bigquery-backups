-- job_id: 8c5adb9b-2bf5-4c35-8dcb-580366e26b91
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:00:30.210000+00:00
-- started: 2026-08-03T12:00:30.313000+00:00
-- ended: 2026-08-03T12:00:32.212000+00:00


    SELECT App_Name, Customer_Number, Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    GROUP BY App_Name, Customer_Number, Order_Id
    HAVING COUNT(1) > 1;
