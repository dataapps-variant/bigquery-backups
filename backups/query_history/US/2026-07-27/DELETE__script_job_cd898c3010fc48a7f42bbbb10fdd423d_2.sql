-- job_id: script_job_cd898c3010fc48a7f42bbbb10fdd423d_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T20:40:07.978000+00:00
-- started: 2026-07-27T20:40:08.437000+00:00
-- ended: 2026-07-27T20:40:09.596000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
