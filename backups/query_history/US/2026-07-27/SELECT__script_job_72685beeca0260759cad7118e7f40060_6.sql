-- job_id: script_job_72685beeca0260759cad7118e7f40060_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T18:23:39.287000+00:00
-- started: 2026-07-27T18:23:39.361000+00:00
-- ended: 2026-07-27T18:23:40.141000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
