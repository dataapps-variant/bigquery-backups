-- job_id: script_job_704ab1ed6da3ac142189f3323d1d4621_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T08:30:02.282000+00:00
-- started: 2026-07-31T08:30:02.638000+00:00
-- ended: 2026-07-31T08:30:03.951000+00:00

DELETE FROM `variant-finance-data-project.VPU.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
