-- job_id: 6260f5fc-a6f8-4a58-9546-f1ecbce0b297
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T12:05:06.430000+00:00
-- started: 2026-08-01T12:05:06.643000+00:00
-- ended: 2026-08-01T12:05:06.927000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Campaign_Id AS campaign_id, Gateway_Id AS gateway_id, Date_of_Sale AS acquisition_date, Test AS is_test_cc
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V` 
WHERE order_id IN ('2411086', '2411400', '2411614', '2412406', '2413285')
