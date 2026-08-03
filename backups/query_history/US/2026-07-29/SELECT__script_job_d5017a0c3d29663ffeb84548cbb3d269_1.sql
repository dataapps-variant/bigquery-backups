-- job_id: script_job_d5017a0c3d29663ffeb84548cbb3d269_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:06.033000+00:00
-- started: 2026-07-29T08:45:06.076000+00:00
-- ended: 2026-07-29T08:45:06.278000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball`
)).*;
