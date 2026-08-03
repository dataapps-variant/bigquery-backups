-- job_id: script_job_6ff7ec208564dd146ee7e80ef5f7f4c5_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:11:28.945000+00:00
-- started: 2026-07-31T09:11:29.098000+00:00
-- ended: 2026-07-31T09:11:29.365000+00:00

SELECT column_name, data_type, is_nullable
FROM `variant-finance-data-project.Cohort_Hunter.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'User_Feature_Wide'
ORDER BY ordinal_position
