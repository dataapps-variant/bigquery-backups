-- job_id: c535c532-aac5-4168-8a51-a51e3d7df111
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:00:31.346000+00:00
-- started: 2026-07-30T12:00:31.440000+00:00
-- ended: 2026-07-30T12:00:31.880000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Entity_Name AS entity_code
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
WHERE Final_Order_Status <> 7 AND Billing_Cycle = '0'  AND Entity_Name IN ('CT', 'EN') AND Date_of_Sale = current_date - 1 AND Trial_Type <> 'SS'
