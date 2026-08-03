-- job_id: script_job_8803cb440fc4c9046c99bc4dea429284_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:11:29.605000+00:00
-- started: 2026-07-31T09:11:29.689000+00:00
-- ended: 2026-07-31T09:11:29.985000+00:00

SELECT schema_name, location
FROM `variant-finance-data-project.INFORMATION_SCHEMA.SCHEMATA`
WHERE schema_name = 'Cohort_Hunter'
