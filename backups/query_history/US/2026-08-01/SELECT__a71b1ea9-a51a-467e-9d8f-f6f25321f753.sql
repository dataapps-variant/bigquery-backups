-- job_id: a71b1ea9-a51a-467e-9d8f-f6f25321f753
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:03:09.406000+00:00
-- started: 2026-08-01T12:03:09.514000+00:00
-- ended: 2026-08-01T12:03:09.784000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Entity_Name AS entity_code
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
WHERE Final_Order_Status <> 7 AND Billing_Cycle = '0'  AND Entity_Name IN ('FS') AND Date_of_Sale = current_date - 1 AND Trial_Type = 'SS'
