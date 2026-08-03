-- job_id: script_job_91653c8962e8a3bd41f6546571d17cf9_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T02:40:16.210000+00:00
-- started: 2026-07-28T02:40:16.312000+00:00
-- ended: 2026-07-28T02:40:16.511000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
