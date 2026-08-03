-- job_id: script_job_6d33b2671f5185fb41cebcf4e74fd287_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:05.424000+00:00
-- started: 2026-07-31T08:45:05.484000+00:00
-- ended: 2026-07-31T08:45:05.658000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table`
)).*;
