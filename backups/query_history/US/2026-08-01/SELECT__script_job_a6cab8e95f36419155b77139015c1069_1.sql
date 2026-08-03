-- job_id: script_job_a6cab8e95f36419155b77139015c1069_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:03.885000+00:00
-- started: 2026-08-01T08:45:03.963000+00:00
-- ended: 2026-08-01T08:45:04.164000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball`
)).*;
