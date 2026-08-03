-- job_id: 4d96f002-ee79-4597-96f2-2f3e366e6a83
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:03:57.684000+00:00
-- started: 2026-07-31T12:03:57.838000+00:00
-- ended: 2026-07-31T12:03:58.436000+00:00


SELECT Order_Id AS order_id, Final_Order_Status AS order_status, Entity_Name AS entity_code
FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
WHERE Final_Order_Status <> 7 AND Billing_Cycle = '0'  AND Entity_Name IN ('PD') AND Date_of_Sale = current_date - 1 AND Trial_Type <> 'SS'
