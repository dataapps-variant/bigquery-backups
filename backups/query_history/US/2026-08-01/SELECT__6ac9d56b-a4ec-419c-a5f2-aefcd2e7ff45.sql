-- job_id: 6ac9d56b-a4ec-419c-a5f2-aefcd2e7ff45
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:05:04.923000+00:00
-- started: 2026-08-01T12:05:05.173000+00:00
-- ended: 2026-08-01T12:05:05.689000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Campaign_Id AS campaign_id, Gateway_Id AS gateway_id, Date_of_Sale AS acquisition_date, Test AS is_test_cc
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V` 
WHERE order_id IN ('2411086', '2411400', '2411614', '2412406', '2413285')
