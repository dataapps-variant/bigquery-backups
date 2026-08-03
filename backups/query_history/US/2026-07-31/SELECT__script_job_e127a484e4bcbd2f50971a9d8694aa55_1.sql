-- job_id: script_job_e127a484e4bcbd2f50971a9d8694aa55_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:04.965000+00:00
-- started: 2026-07-31T08:45:05.021000+00:00
-- ended: 2026-07-31T08:45:05.197000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball`
)).*;
