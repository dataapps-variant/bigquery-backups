-- job_id: script_job_97a46e4657a2876f70f267528dcaf45d_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:06.173000+00:00
-- started: 2026-07-28T08:45:06.247000+00:00
-- ended: 2026-07-28T08:45:06.487000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`
)).*;
