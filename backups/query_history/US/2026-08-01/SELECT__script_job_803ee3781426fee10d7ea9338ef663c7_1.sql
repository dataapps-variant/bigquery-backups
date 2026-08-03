-- job_id: script_job_803ee3781426fee10d7ea9338ef663c7_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:05.837000+00:00
-- started: 2026-08-01T08:45:05.906000+00:00
-- ended: 2026-08-01T08:45:06.105000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball`
)).*;
