-- job_id: script_job_092752998309106dfea07149e9121533_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T18:40:06.453000+00:00
-- started: 2026-07-27T18:40:06.855000+00:00
-- ended: 2026-07-27T18:40:07.922000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
