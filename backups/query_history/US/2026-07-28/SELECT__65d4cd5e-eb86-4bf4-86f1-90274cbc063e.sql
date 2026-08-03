-- job_id: 65d4cd5e-eb86-4bf4-86f1-90274cbc063e
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:04:48.527000+00:00
-- started: 2026-07-28T12:04:48.750000+00:00
-- ended: 2026-07-28T12:04:48.945000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Campaign_Id AS campaign_id, Gateway_Id AS gateway_id, Date_of_Sale AS acquisition_date, Test AS is_test_cc
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V` 
WHERE order_id IN ('2378517', '2378807', '2379048', '2379751', '2380652')
