-- job_id: 0fc60aa2-32b4-486a-b54d-e080a7791750
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:03:20.266000+00:00
-- started: 2026-07-29T12:03:20.580000+00:00
-- ended: 2026-07-29T12:03:20.923000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Campaign_Id AS campaign_id, Gateway_Id AS gateway_id, Date_of_Sale AS acquisition_date, Test AS is_test_cc
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF` 
WHERE order_id IN ('7283146', '7283176')
