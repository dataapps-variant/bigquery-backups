-- job_id: script_job_bfcf67017d3f13cd9ea1523f10c66e0b_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T03:40:05.122000+00:00
-- started: 2026-07-28T03:40:05.494000+00:00
-- ended: 2026-07-28T03:40:07.093000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
