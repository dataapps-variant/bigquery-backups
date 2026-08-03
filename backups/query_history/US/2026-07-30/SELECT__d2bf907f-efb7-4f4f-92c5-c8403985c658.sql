-- job_id: d2bf907f-efb7-4f4f-92c5-c8403985c658
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:03:17.363000+00:00
-- started: 2026-07-30T12:03:18.169000+00:00
-- ended: 2026-07-30T12:03:18.753000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Campaign_Id AS campaign_id, Gateway_Id AS gateway_id, Date_of_Sale AS acquisition_date, Test AS is_test_cc
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF` 
WHERE order_id IN ('7286603')
