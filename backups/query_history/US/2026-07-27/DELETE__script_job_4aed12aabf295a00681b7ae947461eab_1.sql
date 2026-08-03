-- job_id: script_job_4aed12aabf295a00681b7ae947461eab_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T16:40:03.283000+00:00
-- started: 2026-07-27T16:40:03.680000+00:00
-- ended: 2026-07-27T16:40:05.402000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
