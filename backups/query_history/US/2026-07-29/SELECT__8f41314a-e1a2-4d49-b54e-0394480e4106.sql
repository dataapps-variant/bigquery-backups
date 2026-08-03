-- job_id: 8f41314a-e1a2-4d49-b54e-0394480e4106
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:05:06.572000+00:00
-- started: 2026-07-29T12:05:06.797000+00:00
-- ended: 2026-07-29T12:05:07.368000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Campaign_Id AS campaign_id, Gateway_Id AS gateway_id, Date_of_Sale AS acquisition_date, Test AS is_test_cc
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V` 
WHERE order_id IN ('2383061', '2383361', '2384259', '2385174')
