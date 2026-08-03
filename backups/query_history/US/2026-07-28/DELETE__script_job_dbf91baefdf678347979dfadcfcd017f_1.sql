-- job_id: script_job_dbf91baefdf678347979dfadcfcd017f_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T10:40:02.136000+00:00
-- started: 2026-07-28T10:40:02.468000+00:00
-- ended: 2026-07-28T10:40:04.126000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
