-- job_id: 00ace95a-1149-4905-b0f9-dbebe7ca84ee
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:05:05.013000+00:00
-- started: 2026-08-03T12:05:05.243000+00:00
-- ended: 2026-08-03T12:05:05.503000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Campaign_Id AS campaign_id, Gateway_Id AS gateway_id, Date_of_Sale AS acquisition_date, Test AS is_test_cc
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V` 
WHERE order_id IN ('2430075', '2430221', '2430615', '2431185')
