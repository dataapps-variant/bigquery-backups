-- job_id: script_job_37b3b39cd3c85b8a1c83d30560b5c3a8_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:45:11.166000+00:00
-- started: 2026-08-01T09:45:11.213000+00:00
-- ended: 2026-08-01T09:45:11.437000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Crystal_Ball_30`
)).*;
