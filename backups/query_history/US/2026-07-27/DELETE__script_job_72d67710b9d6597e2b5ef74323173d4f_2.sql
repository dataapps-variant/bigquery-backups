-- job_id: script_job_72d67710b9d6597e2b5ef74323173d4f_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T15:40:09.380000+00:00
-- started: 2026-07-27T15:40:09.707000+00:00
-- ended: 2026-07-27T15:40:10.834000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
