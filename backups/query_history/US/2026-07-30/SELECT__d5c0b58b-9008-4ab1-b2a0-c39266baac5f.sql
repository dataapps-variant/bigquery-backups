-- job_id: d5c0b58b-9008-4ab1-b2a0-c39266baac5f
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:01:55.455000+00:00
-- started: 2026-07-30T12:01:55.657000+00:00
-- ended: 2026-07-30T12:01:56.301000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Campaign_Id AS campaign_id, Gateway_Id AS gateway_id, Date_of_Sale AS acquisition_date, Test AS is_test_cc
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT` 
WHERE order_id IN ('4827450', '4827452', '4829146', '4829147', '4829156', '4829212', '4829218', '4829219', '4829220', '4829221', '4829231', '4829236', '4829243', '4829260', '4829270', '4829271', '4829272', '4829273', '4829279', '4829287', '4829303', '4829319', '4829324', '4829325', '4829326', '4829327', '4829410', '4829411', '4829412', '4829413', '4829484', '4829485', '4829486', '4829487', '4829573', '4829574', '4829575', '4829576', '4829677', '4829678', '4829679', '4829680', '4829754', '4829755', '4829756', '4829757', '4829844', '4829845', '4829846', '4829847', '4830016', '4830017', '4830018', '4830019')
