-- job_id: job_xTxsqTe-iXRjlstAQPpsEwf2h45z
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:13:59.600000+00:00
-- started: 2026-07-28T15:13:59.690000+00:00
-- ended: 2026-07-28T15:14:00.102000+00:00


  SELECT Day_Index, BC_Number, ROUND(Daily_Refund_Rate*100,4) AS pct
  FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
  WHERE Curve_Name = 'PD4988MT' ORDER BY Day_Index LIMIT 8
