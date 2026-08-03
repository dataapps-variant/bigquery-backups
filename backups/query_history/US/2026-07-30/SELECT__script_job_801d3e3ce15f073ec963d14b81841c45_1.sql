-- job_id: script_job_801d3e3ce15f073ec963d14b81841c45_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:30:10.202000+00:00
-- started: 2026-07-30T09:30:10.299000+00:00
-- ended: 2026-07-30T09:30:10.708000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`
)).*;
