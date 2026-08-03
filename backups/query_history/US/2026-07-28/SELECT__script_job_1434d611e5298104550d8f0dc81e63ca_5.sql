-- job_id: script_job_1434d611e5298104550d8f0dc81e63ca_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T14:40:11.495000+00:00
-- started: 2026-07-28T14:40:11.642000+00:00
-- ended: 2026-07-28T14:40:11.838000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
