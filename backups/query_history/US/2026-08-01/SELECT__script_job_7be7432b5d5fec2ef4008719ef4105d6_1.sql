-- job_id: script_job_7be7432b5d5fec2ef4008719ef4105d6_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T10:00:04.413000+00:00
-- started: 2026-08-01T10:00:04.563000+00:00
-- ended: 2026-08-01T10:00:04.803000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Main_Table_MP`
)).*;
