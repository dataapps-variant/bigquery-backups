-- job_id: script_job_7e866f71c81a4fd663e51f80becedc7b_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:45:03.841000+00:00
-- started: 2026-08-03T09:45:03.952000+00:00
-- ended: 2026-08-03T09:45:04.180000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Crystal_Ball_30`
)).*;
