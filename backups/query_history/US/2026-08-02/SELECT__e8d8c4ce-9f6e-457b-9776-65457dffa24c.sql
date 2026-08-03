-- job_id: e8d8c4ce-9f6e-457b-9776-65457dffa24c
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T12:04:23.644000+00:00
-- started: 2026-08-02T12:04:23.948000+00:00
-- ended: 2026-08-02T12:04:24.290000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Campaign_Id AS campaign_id, Gateway_Id AS gateway_id, Date_of_Sale AS acquisition_date, Test AS is_test_cc
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD_V` 
WHERE order_id IN ('2415033', '2427583', '2428044', '2428505')
