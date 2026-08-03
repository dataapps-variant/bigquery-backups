-- job_id: eacdd403-8780-4ea0-bae7-25bfdb28c67f
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:00:26.153000+00:00
-- started: 2026-07-29T12:00:26.233000+00:00
-- ended: 2026-07-29T12:00:28.117000+00:00


    SELECT App_Name, Customer_Number, Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    GROUP BY App_Name, Customer_Number, Order_Id
    HAVING COUNT(1) > 1;
