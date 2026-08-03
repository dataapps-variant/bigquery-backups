-- job_id: 7726760c-f363-4bb3-a840-dc4a8100a82d
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:01:39.528000+00:00
-- started: 2026-07-29T12:01:39.760000+00:00
-- ended: 2026-07-29T12:01:40.422000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Campaign_Id AS campaign_id, Gateway_Id AS gateway_id, Date_of_Sale AS acquisition_date, Test AS is_test_cc
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT` 
WHERE order_id IN ('4814797', '4814798', '4816856', '4816857', '4816897', '4816904', '4816905', '4816926', '4816962', '4816963', '4817040', '4817041', '4817140', '4817141', '4825746', '4825747', '4825842', '4825843', '4825920', '4825921', '4826005', '4826006', '4826091', '4826092', '4826249', '4826250')
