-- job_id: script_job_1af43d93f44be76c2bbbf1cd60c734ff_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:07.593000+00:00
-- started: 2026-07-29T08:45:07.679000+00:00
-- ended: 2026-07-29T08:45:07.906000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`
)).*;
