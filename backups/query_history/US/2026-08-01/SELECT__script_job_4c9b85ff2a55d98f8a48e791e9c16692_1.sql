-- job_id: script_job_4c9b85ff2a55d98f8a48e791e9c16692_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:03.822000+00:00
-- started: 2026-08-01T08:45:03.885000+00:00
-- ended: 2026-08-01T08:45:04.072000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Main_Table`
)).*;
