-- job_id: script_job_2ec4ec675b2c5791e42ec15edcdc61c6_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T00:40:05.860000+00:00
-- started: 2026-07-28T00:40:06.304000+00:00
-- ended: 2026-07-28T00:40:07.392000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
