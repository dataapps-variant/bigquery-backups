-- job_id: script_job_99bc0d764bae5d49ff21d2d44dc90f89_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T08:30:07.454000+00:00
-- started: 2026-08-01T08:30:07.985000+00:00
-- ended: 2026-08-01T08:30:09.292000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
