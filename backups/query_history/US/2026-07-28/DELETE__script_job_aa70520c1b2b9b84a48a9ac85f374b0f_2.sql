-- job_id: script_job_aa70520c1b2b9b84a48a9ac85f374b0f_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T06:40:07.700000+00:00
-- started: 2026-07-28T06:40:08.071000+00:00
-- ended: 2026-07-28T06:40:09.054000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
