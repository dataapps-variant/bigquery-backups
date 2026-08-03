-- job_id: script_job_42053648024d194f57d68d8f90c889dd_7
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T03:40:16.284000+00:00
-- started: 2026-07-28T03:40:16.394000+00:00
-- ended: 2026-07-28T03:40:16.919000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
