-- job_id: script_job_f26f918ac2252e8815d0d38a4d55ac6b_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-02T09:30:03.703000+00:00
-- started: 2026-08-02T09:30:04.117000+00:00
-- ended: 2026-08-02T09:30:05.426000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
