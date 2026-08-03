-- job_id: 5688b987-f81d-45d0-b5f4-a75b73b70ac3
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T12:02:21.429000+00:00
-- started: 2026-08-02T12:02:21.524000+00:00
-- ended: 2026-08-02T12:02:21.841000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Entity_Name AS entity_code
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
WHERE Final_Order_Status <> 7 AND Billing_Cycle = '0'  AND Entity_Name IN ('JF', 'CL', 'CV', 'RT', 'RL') AND Date_of_Sale = current_date - 1 AND Trial_Type <> 'SS'
