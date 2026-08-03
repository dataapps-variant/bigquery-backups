-- job_id: script_job_2a0c31bfda2f166925cc9f2d9464d98f_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:08.143000+00:00
-- started: 2026-07-30T08:45:08.224000+00:00
-- ended: 2026-07-30T08:45:08.415000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`
)).*;
