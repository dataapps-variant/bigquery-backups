-- job_id: script_job_774de5d9649dc5054ef7f5885ac1b291_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:07.142000+00:00
-- started: 2026-07-29T08:45:07.222000+00:00
-- ended: 2026-07-29T08:45:07.431000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table`
)).*;
