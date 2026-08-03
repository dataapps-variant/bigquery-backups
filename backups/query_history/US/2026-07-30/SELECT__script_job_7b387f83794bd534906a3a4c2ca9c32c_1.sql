-- job_id: script_job_7b387f83794bd534906a3a4c2ca9c32c_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:07.483000+00:00
-- started: 2026-07-30T08:45:07.558000+00:00
-- ended: 2026-07-30T08:45:07.721000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball`
)).*;
