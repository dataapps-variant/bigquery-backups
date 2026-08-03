-- job_id: script_job_20f5494a111cc63b62993154c5fda2cb_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T15:10:10.181000+00:00
-- started: 2026-07-27T15:10:10.658000+00:00
-- ended: 2026-07-27T15:10:12.754000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
