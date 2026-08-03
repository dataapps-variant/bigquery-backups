-- job_id: script_job_ea315a837bf48740a16da56377a73689_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:03.374000+00:00
-- started: 2026-08-03T08:45:03.433000+00:00
-- ended: 2026-08-03T08:45:03.639000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball`
)).*;
