-- job_id: 40ebdce2-43b3-4859-8c85-3fb6d3e18d49
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:05:18.288000+00:00
-- started: 2026-07-31T12:05:18.445000+00:00
-- ended: 2026-07-31T12:05:18.783000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Campaign_Id AS campaign_id, Gateway_Id AS gateway_id, Date_of_Sale AS acquisition_date, Test AS is_test_cc
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V` 
WHERE order_id IN ('2392993', '2393186', '2406214', '2406491', '2407321', '2408357')
