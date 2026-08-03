-- job_id: script_job_0468324bdbe285db6ec6a037c7b51533_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T09:30:01.953000+00:00
-- started: 2026-07-28T09:30:02.277000+00:00
-- ended: 2026-07-28T09:30:03.496000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
