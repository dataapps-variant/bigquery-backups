-- job_id: script_job_a91380f8140272ae28218cc28064826a_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T01:40:08.055000+00:00
-- started: 2026-07-28T01:40:08.461000+00:00
-- ended: 2026-07-28T01:40:09.415000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
