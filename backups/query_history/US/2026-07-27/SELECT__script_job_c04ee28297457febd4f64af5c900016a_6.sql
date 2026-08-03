-- job_id: script_job_c04ee28297457febd4f64af5c900016a_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T21:40:14.134000+00:00
-- started: 2026-07-27T21:40:14.207000+00:00
-- ended: 2026-07-27T21:40:14.509000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
