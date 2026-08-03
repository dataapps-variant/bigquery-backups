-- job_id: script_job_21541c8a829312a3ed6b960d289d1339_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T22:40:11.211000+00:00
-- started: 2026-07-27T22:40:11.715000+00:00
-- ended: 2026-07-27T22:40:12.871000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
