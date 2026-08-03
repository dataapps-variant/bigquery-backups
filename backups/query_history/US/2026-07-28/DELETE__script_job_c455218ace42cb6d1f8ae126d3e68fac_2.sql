-- job_id: script_job_c455218ace42cb6d1f8ae126d3e68fac_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T08:40:04.551000+00:00
-- started: 2026-07-28T08:40:04.903000+00:00
-- ended: 2026-07-28T08:40:05.987000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
