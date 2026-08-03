-- job_id: script_job_9dd804431348867c33dc91331c2c5ed2_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T08:30:03.972000+00:00
-- started: 2026-08-02T08:30:04.510000+00:00
-- ended: 2026-08-02T08:30:06.368000+00:00

DELETE FROM `variant-finance-data-project.VPU.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
