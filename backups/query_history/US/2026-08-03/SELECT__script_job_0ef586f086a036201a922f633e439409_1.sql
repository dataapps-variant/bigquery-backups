-- job_id: script_job_0ef586f086a036201a922f633e439409_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:03.409000+00:00
-- started: 2026-08-03T08:45:03.453000+00:00
-- ended: 2026-08-03T08:45:03.618000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`
)).*;
