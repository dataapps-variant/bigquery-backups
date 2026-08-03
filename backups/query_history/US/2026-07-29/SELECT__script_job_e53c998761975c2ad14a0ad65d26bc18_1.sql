-- job_id: script_job_e53c998761975c2ad14a0ad65d26bc18_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:07.574000+00:00
-- started: 2026-07-29T08:45:07.667000+00:00
-- ended: 2026-07-29T08:45:07.875000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Crystal_Ball_AFID`
)).*;
