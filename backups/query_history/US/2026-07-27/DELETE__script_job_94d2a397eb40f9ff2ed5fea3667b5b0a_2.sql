-- job_id: script_job_94d2a397eb40f9ff2ed5fea3667b5b0a_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T18:23:28.134000+00:00
-- started: 2026-07-27T18:23:28.543000+00:00
-- ended: 2026-07-27T18:23:31.380000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
