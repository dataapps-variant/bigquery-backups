-- job_id: script_job_3a8dea713d06e4f7f84270d6581d3a61_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:04.401000+00:00
-- started: 2026-07-28T08:45:04.478000+00:00
-- ended: 2026-07-28T08:45:04.658000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table`
)).*;
