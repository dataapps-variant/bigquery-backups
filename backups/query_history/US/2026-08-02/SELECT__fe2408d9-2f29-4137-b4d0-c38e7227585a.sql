-- job_id: fe2408d9-2f29-4137-b4d0-c38e7227585a
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T12:00:23.535000+00:00
-- started: 2026-08-02T12:00:23.655000+00:00
-- ended: 2026-08-02T12:00:25.151000+00:00


    SELECT App_Name, Customer_Number, Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    GROUP BY App_Name, Customer_Number, Order_Id
    HAVING COUNT(1) > 1;
