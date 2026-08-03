-- job_id: script_job_44279359fce36b4188f88a472d8a8a37_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T05:40:02.253000+00:00
-- started: 2026-07-28T05:40:02.766000+00:00
-- ended: 2026-07-28T05:40:04.681000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
