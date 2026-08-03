-- job_id: script_job_e0c3ce08beeeeb41de9319ef7e66fa40_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T18:23:20.404000+00:00
-- started: 2026-07-27T18:23:20.769000+00:00
-- ended: 2026-07-27T18:23:27.978000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
