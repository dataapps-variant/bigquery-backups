-- job_id: script_job_4c2ba57201e3315dcea20fd5be9f18ff_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:03.246000+00:00
-- started: 2026-07-28T08:45:03.367000+00:00
-- ended: 2026-07-28T08:45:03.584000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`
)).*;
