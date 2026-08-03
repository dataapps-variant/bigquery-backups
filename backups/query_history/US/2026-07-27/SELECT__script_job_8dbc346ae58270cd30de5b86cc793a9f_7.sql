-- job_id: script_job_8dbc346ae58270cd30de5b86cc793a9f_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T14:03:52.748000+00:00
-- started: 2026-07-27T14:03:52.820000+00:00
-- ended: 2026-07-27T14:03:53.089000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
