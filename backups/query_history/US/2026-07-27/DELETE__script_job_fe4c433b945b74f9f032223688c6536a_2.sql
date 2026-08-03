-- job_id: script_job_fe4c433b945b74f9f032223688c6536a_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T14:10:09.214000+00:00
-- started: 2026-07-27T14:10:09.619000+00:00
-- ended: 2026-07-27T14:10:10.663000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
