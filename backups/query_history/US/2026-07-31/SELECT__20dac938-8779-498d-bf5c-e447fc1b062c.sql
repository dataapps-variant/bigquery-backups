-- job_id: 20dac938-8779-498d-bf5c-e447fc1b062c
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:00:31.491000+00:00
-- started: 2026-07-31T12:00:31.596000+00:00
-- ended: 2026-07-31T12:00:33.925000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Entity_Name AS entity_code
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
WHERE Final_Order_Status <> 7 AND Billing_Cycle = '0'  AND Entity_Name IN ('AT', 'IQ') AND Date_of_Sale = current_date - 1 AND Trial_Type <> 'SS'
