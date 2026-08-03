-- job_id: 2e3b231b-483c-4a1e-819e-84586182fff1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:43:14.500000+00:00
-- started: 2026-07-30T12:43:14.602000+00:00
-- ended: 2026-07-30T12:43:15.553000+00:00

SELECT DISTINCT afid, spend_country_code_afid FROM `variant-finance-data-project.Cohort_Hunter.User_Feature_Table` WHERE afid LIKE 'gdn%' LIMIT 10
