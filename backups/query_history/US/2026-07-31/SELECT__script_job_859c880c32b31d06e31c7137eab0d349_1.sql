-- job_id: script_job_859c880c32b31d06e31c7137eab0d349_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:05.905000+00:00
-- started: 2026-07-31T08:45:05.972000+00:00
-- ended: 2026-07-31T08:45:06.168000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table`
)).*;
