-- job_id: script_job_264a320865ce46d852670a40029f5727_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T08:30:03.791000+00:00
-- started: 2026-08-01T08:30:04.080000+00:00
-- ended: 2026-08-01T08:30:08.173000+00:00

DELETE FROM `variant-finance-data-project.VPU.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
