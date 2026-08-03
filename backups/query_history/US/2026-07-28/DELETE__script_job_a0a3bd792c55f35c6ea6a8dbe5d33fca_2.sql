-- job_id: script_job_a0a3bd792c55f35c6ea6a8dbe5d33fca_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T15:40:06.286000+00:00
-- started: 2026-07-28T15:40:06.733000+00:00
-- ended: 2026-07-28T15:40:08.843000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
