-- job_id: script_job_d91809a5959e8e3bf180c2334d753f31_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T15:10:12.971000+00:00
-- started: 2026-07-27T15:10:13.490000+00:00
-- ended: 2026-07-27T15:10:14.779000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
