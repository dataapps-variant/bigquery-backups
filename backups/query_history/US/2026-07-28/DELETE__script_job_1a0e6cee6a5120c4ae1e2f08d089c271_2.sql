-- job_id: script_job_1a0e6cee6a5120c4ae1e2f08d089c271_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T02:40:07.657000+00:00
-- started: 2026-07-28T02:40:08.087000+00:00
-- ended: 2026-07-28T02:40:09.132000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
