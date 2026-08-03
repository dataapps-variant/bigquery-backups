-- job_id: d5103b0c-897e-45b8-a66d-a4cd90f87482
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:01:53.108000+00:00
-- started: 2026-07-29T12:01:53.198000+00:00
-- ended: 2026-07-29T12:01:54.072000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Entity_Name AS entity_code
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
WHERE Final_Order_Status <> 7 AND Billing_Cycle = '0'  AND Entity_Name IN ('JF', 'CL', 'CV', 'RT', 'RL') AND Date_of_Sale = current_date - 1 AND Trial_Type = 'SS'
