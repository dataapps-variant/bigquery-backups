-- job_id: script_job_5c5b20f90746a688f895e6ae94da1fce_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T14:40:01.823000+00:00
-- started: 2026-07-28T14:40:02.213000+00:00
-- ended: 2026-07-28T14:40:03.833000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
