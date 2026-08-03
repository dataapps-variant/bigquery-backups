-- job_id: 8591e8a2-5724-47b3-bf2c-4273b9c0a9fe
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:00:28.439000+00:00
-- started: 2026-07-31T12:00:28.523000+00:00
-- ended: 2026-07-31T12:00:30.394000+00:00


    SELECT App_Name, Customer_Number, Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    GROUP BY App_Name, Customer_Number, Order_Id
    HAVING COUNT(1) > 1;
