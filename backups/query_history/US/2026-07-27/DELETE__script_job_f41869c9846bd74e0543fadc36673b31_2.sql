-- job_id: script_job_f41869c9846bd74e0543fadc36673b31_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T23:40:04.269000+00:00
-- started: 2026-07-27T23:40:04.627000+00:00
-- ended: 2026-07-27T23:40:05.662000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
