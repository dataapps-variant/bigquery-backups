-- job_id: dc310919-48ea-472d-9fc9-06bd08be4ac5
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:02:14.612000+00:00
-- started: 2026-07-28T12:02:14.844000+00:00
-- ended: 2026-07-28T12:02:15.095000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Campaign_Id AS campaign_id, Gateway_Id AS gateway_id, Date_of_Sale AS acquisition_date, Test AS is_test_cc
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT` 
WHERE order_id IN ('4811315', '4811317', '4812920', '4812921', '4812981', '4812982', '4813041', '4813042', '4813098', '4813099', '4813204', '4813205', '4813223', '4813249', '4813284', '4813285', '4813375', '4813376', '4813469', '4813471', '4813566', '4813567', '4813674', '4813675', '4813876', '4813877')
