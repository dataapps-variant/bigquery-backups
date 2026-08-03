-- job_id: script_job_93067f13575fa3d0144fe3711725cfb0_5
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T12:40:15.672000+00:00
-- started: 2026-07-28T12:40:15.748000+00:00
-- ended: 2026-07-28T12:40:15.948000+00:00

SELECT STRUCT<INT64>((SELECT count(*) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_history` WHERE snapshot_id = v_snapshot_id)).*;
