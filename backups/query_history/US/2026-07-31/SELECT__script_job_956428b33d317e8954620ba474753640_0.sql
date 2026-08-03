-- job_id: script_job_956428b33d317e8954620ba474753640_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:22:51.794000+00:00
-- started: 2026-07-31T09:22:51.891000+00:00
-- ended: 2026-07-31T09:22:52.176000+00:00

SELECT schema_name, location
FROM `variant-finance-data-project.INFORMATION_SCHEMA.SCHEMATA`
WHERE schema_name = 'Cohort_Hunter'
