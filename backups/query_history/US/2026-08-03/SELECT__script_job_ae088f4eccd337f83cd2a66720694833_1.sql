-- job_id: script_job_ae088f4eccd337f83cd2a66720694833_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:03.389000+00:00
-- started: 2026-08-03T08:45:03.467000+00:00
-- ended: 2026-08-03T08:45:03.673000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`
)).*;
