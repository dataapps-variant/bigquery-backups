-- job_id: job_NPnBKZnYUsUQLphTxLpwVYJjGMM3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:07:03.945000+00:00
-- started: 2026-07-28T15:07:04.055000+00:00
-- ended: 2026-07-28T15:07:04.548000+00:00


  SELECT COUNT(DISTINCT Curve_Name) curves, COUNT(DISTINCT Input_ID) inputs,
         COUNTIF(Curve_Name != Plan_Code) rows_where_curve_differs_from_plan
  FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
