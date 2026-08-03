-- job_id: script_job_795b5006a4649414ab9a39b1926c17c2_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-01T08:45:03.078000+00:00
-- started: 2026-08-01T08:45:03.384000+00:00
-- ended: 2026-08-01T08:45:04.454000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
