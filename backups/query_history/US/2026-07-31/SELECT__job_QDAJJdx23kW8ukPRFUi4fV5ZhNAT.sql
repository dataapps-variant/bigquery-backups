-- job_id: job_QDAJJdx23kW8ukPRFUi4fV5ZhNAT
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T11:46:43.434000+00:00
-- started: 2026-07-31T11:46:43.592000+00:00
-- ended: 2026-07-31T11:46:43.707000+00:00

SELECT Input_ID, Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate, Curve_Name, Entity
   FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
