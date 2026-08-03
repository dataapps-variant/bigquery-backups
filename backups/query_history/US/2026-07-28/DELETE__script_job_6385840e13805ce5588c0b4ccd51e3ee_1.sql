-- job_id: script_job_6385840e13805ce5588c0b4ccd51e3ee_1
-- user: dataapps@variant.net
-- statement_type: DELETE
-- created: 2026-07-28T07:40:04.120000+00:00
-- started: 2026-07-28T07:40:04.584000+00:00
-- ended: 2026-07-28T07:40:06.076000+00:00

DELETE FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history`
  WHERE snapshot_id != v_keep_snapshot_id
