-- job_id: script_job_62ebb361384fa4f0eec1835d6da6be7b_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T14:40:04.071000+00:00
-- started: 2026-07-28T14:40:04.410000+00:00
-- ended: 2026-07-28T14:40:05.313000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
