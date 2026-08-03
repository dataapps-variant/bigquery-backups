-- job_id: script_job_7ffe6c57282dab8a86b03e6192adf5ec_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:05.132000+00:00
-- started: 2026-07-31T08:45:05.184000+00:00
-- ended: 2026-07-31T08:45:05.387000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`
)).*;
