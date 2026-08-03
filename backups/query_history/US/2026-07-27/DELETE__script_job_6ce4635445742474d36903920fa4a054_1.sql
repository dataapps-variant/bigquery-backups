-- job_id: script_job_6ce4635445742474d36903920fa4a054_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T22:40:06.330000+00:00
-- started: 2026-07-27T22:40:06.727000+00:00
-- ended: 2026-07-27T22:40:10.823000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
