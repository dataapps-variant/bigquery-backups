-- job_id: script_job_c782c7cf5485763ad521691ad41697c2_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T13:40:05.467000+00:00
-- started: 2026-07-28T13:40:05.817000+00:00
-- ended: 2026-07-28T13:40:07.073000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
