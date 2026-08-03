-- job_id: script_job_9b36e4fef550b0ecac4cc31370fa4c3d_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T17:40:07.142000+00:00
-- started: 2026-07-27T17:40:07.550000+00:00
-- ended: 2026-07-27T17:40:08.603000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
