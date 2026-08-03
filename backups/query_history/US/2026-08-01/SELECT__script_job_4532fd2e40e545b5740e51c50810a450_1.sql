-- job_id: script_job_4532fd2e40e545b5740e51c50810a450_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:05.639000+00:00
-- started: 2026-08-01T08:45:05.856000+00:00
-- ended: 2026-08-01T08:45:06.010000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball`
)).*;
