-- job_id: script_job_a1ca9d270b1a772ecae01984fe588998_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T18:40:14.740000+00:00
-- started: 2026-07-27T18:40:14.803000+00:00
-- ended: 2026-07-27T18:40:15.017000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
