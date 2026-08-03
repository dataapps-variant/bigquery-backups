-- job_id: script_job_17e59fa6e6aad022f1ca5f2065ff4491_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-27T19:40:05.834000+00:00
-- started: 2026-07-27T19:40:06.334000+00:00
-- ended: 2026-07-27T19:40:08.387000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
