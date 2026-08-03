-- job_id: script_job_d1964faa9b2dc046f756d1e37ff0a63b_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T09:40:02.932000+00:00
-- started: 2026-07-28T09:40:03.270000+00:00
-- ended: 2026-07-28T09:40:04.664000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
