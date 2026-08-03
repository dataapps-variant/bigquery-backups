-- job_id: script_job_c793e8cb2dbbc2cc18fbe672efd7dd51_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:03.907000+00:00
-- started: 2026-08-03T08:45:04.012000+00:00
-- ended: 2026-08-03T08:45:04.224000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`
)).*;
