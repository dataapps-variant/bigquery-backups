-- job_id: script_job_c50e61314b89d6d4ddbc7312946071c9_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T07:40:06.851000+00:00
-- started: 2026-07-28T07:40:07.238000+00:00
-- ended: 2026-07-28T07:40:08.109000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
