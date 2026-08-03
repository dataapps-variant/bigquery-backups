-- job_id: script_job_91b58b80d27498216f6c295c093e2ebe_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T16:40:05.605000+00:00
-- started: 2026-07-27T16:40:06.027000+00:00
-- ended: 2026-07-27T16:40:07.049000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
