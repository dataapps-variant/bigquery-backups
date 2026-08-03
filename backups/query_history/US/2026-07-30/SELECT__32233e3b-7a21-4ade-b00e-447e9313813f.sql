-- job_id: 32233e3b-7a21-4ade-b00e-447e9313813f
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:04:18.123000+00:00
-- started: 2026-07-30T12:04:18.370000+00:00
-- ended: 2026-07-30T12:04:19.016000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Campaign_Id AS campaign_id, Gateway_Id AS gateway_id, Date_of_Sale AS acquisition_date, Test AS is_test_cc
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V` 
WHERE order_id IN ('2387672', '2387869', '2387951', '2388605', '2388936', '2390091')
