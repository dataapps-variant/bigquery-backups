-- job_id: 27a9dcfb-2a13-4b0a-9ea6-bdb1b45aa4ca
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T12:00:27.353000+00:00
-- started: 2026-08-02T12:00:27.410000+00:00
-- ended: 2026-08-02T12:00:27.652000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Entity_Name AS entity_code
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
WHERE Final_Order_Status <> 7 AND Billing_Cycle = '0'  AND Entity_Name IN ('AT', 'IQ') AND Date_of_Sale = current_date - 1 AND Trial_Type = 'SS'
