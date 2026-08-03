-- job_id: bfa640d7-f059-4522-acf4-bb60c3b7cf19
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:03:28.410000+00:00
-- started: 2026-07-28T12:03:28.669000+00:00
-- ended: 2026-07-28T12:03:29.232000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Campaign_Id AS campaign_id, Gateway_Id AS gateway_id, Date_of_Sale AS acquisition_date, Test AS is_test_cc
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF` 
WHERE order_id IN ('7282385')
