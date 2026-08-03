-- job_id: ca065e76-d0eb-43e7-8313-98e5201decda
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:00:24.798000+00:00
-- started: 2026-07-28T12:00:24.901000+00:00
-- ended: 2026-07-28T12:00:26.995000+00:00


    SELECT App_Name, Customer_Number, Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    GROUP BY App_Name, Customer_Number, Order_Id
    HAVING COUNT(1) > 1;
