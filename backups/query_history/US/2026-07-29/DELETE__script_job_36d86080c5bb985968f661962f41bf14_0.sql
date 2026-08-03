-- job_id: script_job_36d86080c5bb985968f661962f41bf14_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-29T08:45:04.990000+00:00
-- started: 2026-07-29T08:45:05.428000+00:00
-- ended: 2026-07-29T08:45:06.513000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
