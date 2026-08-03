-- job_id: script_job_8222209300478b9c54b4298407984b77_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:03.914000+00:00
-- started: 2026-07-28T08:45:03.964000+00:00
-- ended: 2026-07-28T08:45:04.140000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`
)).*;
