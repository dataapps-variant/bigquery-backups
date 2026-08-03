-- job_id: bquxjob_5be757ff_19fb842a807
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T13:00:11.101000+00:00
-- started: 2026-07-31T13:00:11.229000+00:00
-- ended: 2026-07-31T13:00:11.726000+00:00

SELECT table_name FROM `variant-finance-data-project.R100.INFORMATION_SCHEMA.TABLES` 
WHERE table_name LIKE '%Input%' OR table_name LIKE '%input%'
ORDER BY table_name
