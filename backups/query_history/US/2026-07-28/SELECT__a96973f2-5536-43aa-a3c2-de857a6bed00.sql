-- job_id: a96973f2-5536-43aa-a3c2-de857a6bed00
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:03:30.043000+00:00
-- started: 2026-07-28T12:03:30.298000+00:00
-- ended: 2026-07-28T12:03:30.530000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Campaign_Id AS campaign_id, Gateway_Id AS gateway_id, Date_of_Sale AS acquisition_date, Test AS is_test_cc
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF` 
WHERE order_id IN ('7282385')
