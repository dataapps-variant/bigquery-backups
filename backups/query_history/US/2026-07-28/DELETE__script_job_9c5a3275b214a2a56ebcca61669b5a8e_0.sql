-- job_id: script_job_9c5a3275b214a2a56ebcca61669b5a8e_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:30:01.753000+00:00
-- started: 2026-07-28T08:30:02.100000+00:00
-- ended: 2026-07-28T08:30:04.462000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
