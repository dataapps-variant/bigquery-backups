-- job_id: script_job_6dcd381b81ecc644a895a053615cced3_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T21:40:05.780000+00:00
-- started: 2026-07-27T21:40:06.210000+00:00
-- ended: 2026-07-27T21:40:07.321000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
