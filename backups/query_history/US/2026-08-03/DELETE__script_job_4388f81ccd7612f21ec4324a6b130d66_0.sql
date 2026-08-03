-- job_id: script_job_4388f81ccd7612f21ec4324a6b130d66_0
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-08-03T08:45:02.246000+00:00
-- started: 2026-08-03T08:45:02.654000+00:00
-- ended: 2026-08-03T08:45:03.826000+00:00

DELETE FROM `variant-finance-data-project.VPU.15K_Crystal_Ball_MP`
WHERE Report_date >= DATE_SUB(
  (SELECT MAX(Report_date) FROM `variant-finance-data-project.VPU.15K_Crystal_Ball_MP`),  -- ▼ (2 of 4) ▼
  INTERVAL lookback_days DAY
)
