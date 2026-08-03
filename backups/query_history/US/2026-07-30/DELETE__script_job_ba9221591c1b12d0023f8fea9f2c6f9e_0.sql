-- job_id: script_job_ba9221591c1b12d0023f8fea9f2c6f9e_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T08:30:04.275000+00:00
-- started: 2026-07-30T08:30:04.618000+00:00
-- ended: 2026-07-30T08:30:05.918000+00:00

DELETE FROM `variant-finance-data-project.VPU.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
