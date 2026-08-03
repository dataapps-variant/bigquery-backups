-- job_id: 11da5e0d-1d0c-44c9-b82f-91ebd5df1464
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:02:57.593000+00:00
-- started: 2026-08-03T12:02:57.746000+00:00
-- ended: 2026-08-03T12:02:58.131000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Entity_Name AS entity_code
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
WHERE Final_Order_Status <> 7 AND Billing_Cycle = '0'  AND Entity_Name IN ('FS') AND Date_of_Sale = current_date - 1 AND Trial_Type = 'SS'
