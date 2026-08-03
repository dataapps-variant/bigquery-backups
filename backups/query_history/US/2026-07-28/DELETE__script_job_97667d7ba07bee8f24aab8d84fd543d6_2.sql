-- job_id: script_job_97667d7ba07bee8f24aab8d84fd543d6_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T10:40:04.348000+00:00
-- started: 2026-07-28T10:40:04.709000+00:00
-- ended: 2026-07-28T10:40:06.012000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
