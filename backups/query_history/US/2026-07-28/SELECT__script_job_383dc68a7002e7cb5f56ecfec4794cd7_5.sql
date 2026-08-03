-- job_id: script_job_383dc68a7002e7cb5f56ecfec4794cd7_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:40:12.646000+00:00
-- started: 2026-07-28T09:40:12.708000+00:00
-- ended: 2026-07-28T09:40:12.930000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
