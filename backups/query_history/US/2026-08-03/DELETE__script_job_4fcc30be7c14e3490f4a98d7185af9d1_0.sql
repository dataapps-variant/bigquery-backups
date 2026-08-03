-- job_id: script_job_4fcc30be7c14e3490f4a98d7185af9d1_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T09:30:02.813000+00:00
-- started: 2026-08-03T09:30:03.160000+00:00
-- ended: 2026-08-03T09:30:04.860000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
