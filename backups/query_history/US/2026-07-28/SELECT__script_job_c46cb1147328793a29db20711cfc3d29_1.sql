-- job_id: script_job_c46cb1147328793a29db20711cfc3d29_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:45:04.609000+00:00
-- started: 2026-07-28T09:45:04.677000+00:00
-- ended: 2026-07-28T09:45:04.877000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Crystal_Ball_30`
)).*;
