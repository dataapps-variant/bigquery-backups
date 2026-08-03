-- job_id: script_job_47e6e21b6db75d94ba34836afc353ac1_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T15:40:06.957000+00:00
-- started: 2026-07-27T15:40:07.342000+00:00
-- ended: 2026-07-27T15:40:09.029000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
