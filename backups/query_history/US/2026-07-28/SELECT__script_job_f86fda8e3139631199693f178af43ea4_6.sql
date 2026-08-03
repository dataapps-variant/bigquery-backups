-- job_id: script_job_f86fda8e3139631199693f178af43ea4_6
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T13:40:13.131000+00:00
-- started: 2026-07-28T13:40:13.188000+00:00
-- ended: 2026-07-28T13:40:13.376000+00:00

SELECT STRUCT<FLOAT64>((SELECT COALESCE(sum(Amount), 0) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id AND Date = current_date)).*;
