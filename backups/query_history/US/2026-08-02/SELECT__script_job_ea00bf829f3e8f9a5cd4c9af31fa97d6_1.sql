-- job_id: script_job_ea00bf829f3e8f9a5cd4c9af31fa97d6_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:03.672000+00:00
-- started: 2026-08-02T08:45:03.780000+00:00
-- ended: 2026-08-02T08:45:04.003000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`
)).*;
