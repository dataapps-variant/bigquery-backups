-- job_id: script_job_dd05abb6a5583309487bce486ec42470_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T03:40:07.418000+00:00
-- started: 2026-07-28T03:40:07.952000+00:00
-- ended: 2026-07-28T03:40:09.258000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
