-- job_id: job_ctVpGnjPi1uJiEx5FsNZqfOngdRd
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T15:13:58.385000+00:00
-- started: 2026-07-28T15:13:58.526000+00:00
-- ended: 2026-07-28T15:13:59.142000+00:00


  SELECT BC_Number, ROUND(SUM(Daily_Refund_Rate)*100, 2) AS pct_sum, COUNT(*) days, MAX(Is_Trial) is_trial
  FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
  WHERE Curve_Name = 'PD4988MT'
  GROUP BY BC_Number ORDER BY BC_Number LIMIT 12
