-- job_id: script_job_ada39de97d3f47014f457fcf17e410f2_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T00:40:14.130000+00:00
-- started: 2026-07-28T00:40:14.291000+00:00
-- ended: 2026-07-28T00:40:14.535000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
