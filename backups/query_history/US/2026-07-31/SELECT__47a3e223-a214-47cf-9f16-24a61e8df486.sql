-- job_id: 47a3e223-a214-47cf-9f16-24a61e8df486
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:03:54.514000+00:00
-- started: 2026-07-31T12:03:54.765000+00:00
-- ended: 2026-07-31T12:03:55.613000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Campaign_Id AS campaign_id, Gateway_Id AS gateway_id, Date_of_Sale AS acquisition_date, Test AS is_test_cc
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF` 
WHERE order_id IN ('7298977', '7299026')
