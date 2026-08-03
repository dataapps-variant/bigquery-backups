-- job_id: script_job_132d7d5a2feef18fabec0b82febbba41_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:08.454000+00:00
-- started: 2026-08-01T08:45:08.533000+00:00
-- ended: 2026-08-01T08:45:08.769000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`
)).*;
