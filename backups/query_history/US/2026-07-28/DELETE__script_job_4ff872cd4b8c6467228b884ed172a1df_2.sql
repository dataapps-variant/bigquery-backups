-- job_id: script_job_4ff872cd4b8c6467228b884ed172a1df_2
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T05:40:04.969000+00:00
-- started: 2026-07-28T05:40:05.360000+00:00
-- ended: 2026-07-28T05:40:06.342000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
WHERE snapshot_date < DATE_SUB(current_date, INTERVAL 2 DAY)
