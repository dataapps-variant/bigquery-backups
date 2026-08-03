-- job_id: script_job_79d31af3a930834affa886700052c98e_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:30:03.622000+00:00
-- started: 2026-08-03T08:30:03.684000+00:00
-- ended: 2026-08-03T08:30:03.870000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`
)).*;
