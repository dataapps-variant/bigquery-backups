-- job_id: script_job_c0ce3a3e9139d85d8ea49ba79dc68663_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T14:40:12.085000+00:00
-- started: 2026-07-28T14:40:12.146000+00:00
-- ended: 2026-07-28T14:40:12.332000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
