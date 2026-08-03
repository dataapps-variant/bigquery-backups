-- job_id: script_job_d4764057dce17abb23d64cc7c4129184_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:30:05.559000+00:00
-- started: 2026-07-29T09:30:05.646000+00:00
-- ended: 2026-07-29T09:30:05.869000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`
)).*;
