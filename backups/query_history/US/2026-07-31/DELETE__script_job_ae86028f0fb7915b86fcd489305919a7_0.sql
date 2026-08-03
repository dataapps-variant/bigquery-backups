-- job_id: script_job_ae86028f0fb7915b86fcd489305919a7_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-31T09:30:05.411000+00:00
-- started: 2026-07-31T09:30:05.776000+00:00
-- ended: 2026-07-31T09:30:07.123000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
