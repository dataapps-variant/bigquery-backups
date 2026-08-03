-- job_id: script_job_ec30b8acbc3b327787fdd0dd2326c1a0_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T11:40:04.151000+00:00
-- started: 2026-07-28T11:40:04.583000+00:00
-- ended: 2026-07-28T11:40:05.545000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
