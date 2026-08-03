-- job_id: 56f0fdb9-86b2-4594-b381-147e4ef487e7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T12:43:54.639000+00:00
-- started: 2026-07-30T12:43:54.759000+00:00
-- ended: 2026-07-30T12:43:54.971000+00:00


SELECT table_name, SUBSTR(view_definition, 1, 800) v FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.INFORMATION_SCHEMA.VIEWS`
