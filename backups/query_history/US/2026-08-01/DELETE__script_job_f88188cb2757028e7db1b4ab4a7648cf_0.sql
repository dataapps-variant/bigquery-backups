-- job_id: script_job_f88188cb2757028e7db1b4ab4a7648cf_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T09:30:05.153000+00:00
-- started: 2026-08-01T09:30:05.683000+00:00
-- ended: 2026-08-01T09:30:06.901000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
