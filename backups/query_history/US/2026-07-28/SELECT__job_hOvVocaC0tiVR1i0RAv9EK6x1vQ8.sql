-- job_id: job_hOvVocaC0tiVR1i0RAv9EK6x1vQ8
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:10:29.382000+00:00
-- started: 2026-07-28T15:10:29.475000+00:00
-- ended: 2026-07-28T15:10:29.592000+00:00

SELECT Input_ID, Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
   FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
