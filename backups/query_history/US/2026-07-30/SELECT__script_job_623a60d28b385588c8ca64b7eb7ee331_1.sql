-- job_id: script_job_623a60d28b385588c8ca64b7eb7ee331_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:45:10.543000+00:00
-- started: 2026-07-30T09:45:10.598000+00:00
-- ended: 2026-07-30T09:45:10.815000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_Crystal_Ball_30`
)).*;
