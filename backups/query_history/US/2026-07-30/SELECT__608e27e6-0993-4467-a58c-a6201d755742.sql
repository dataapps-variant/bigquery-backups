-- job_id: 608e27e6-0993-4467-a58c-a6201d755742
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:00:25.166000+00:00
-- started: 2026-07-30T12:00:25.293000+00:00
-- ended: 2026-07-30T12:00:26.983000+00:00


    SELECT App_Name, Customer_Number, Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    GROUP BY App_Name, Customer_Number, Order_Id
    HAVING COUNT(1) > 1;
