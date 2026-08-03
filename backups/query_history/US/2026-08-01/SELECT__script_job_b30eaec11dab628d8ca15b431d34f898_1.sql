-- job_id: script_job_b30eaec11dab628d8ca15b431d34f898_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:05.670000+00:00
-- started: 2026-08-01T08:45:05.760000+00:00
-- ended: 2026-08-01T08:45:05.932000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`
)).*;
