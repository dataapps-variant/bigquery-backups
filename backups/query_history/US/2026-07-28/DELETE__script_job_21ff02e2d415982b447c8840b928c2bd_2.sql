-- job_id: script_job_21ff02e2d415982b447c8840b928c2bd_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T12:40:07.808000+00:00
-- started: 2026-07-28T12:40:08.108000+00:00
-- ended: 2026-07-28T12:40:09.093000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
