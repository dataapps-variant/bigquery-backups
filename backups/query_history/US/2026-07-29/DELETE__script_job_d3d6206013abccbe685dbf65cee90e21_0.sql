-- job_id: script_job_d3d6206013abccbe685dbf65cee90e21_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T09:30:03.644000+00:00
-- started: 2026-07-29T09:30:04.051000+00:00
-- ended: 2026-07-29T09:30:05.377000+00:00

DELETE FROM `variant-finance-data-project.VPU_Merged.Refund_Table`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU_Merged.Refund_Table`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
