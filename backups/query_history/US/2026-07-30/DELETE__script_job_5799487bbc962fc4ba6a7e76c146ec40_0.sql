-- job_id: script_job_5799487bbc962fc4ba6a7e76c146ec40_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-30T09:30:06.757000+00:00
-- started: 2026-07-30T09:30:07.260000+00:00
-- ended: 2026-07-30T09:30:08.561000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
