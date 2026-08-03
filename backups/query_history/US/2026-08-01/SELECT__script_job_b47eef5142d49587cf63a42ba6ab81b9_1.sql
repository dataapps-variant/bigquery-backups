-- job_id: script_job_b47eef5142d49587cf63a42ba6ab81b9_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:30:06.320000+00:00
-- started: 2026-08-01T09:30:06.425000+00:00
-- ended: 2026-08-01T09:30:06.645000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.15K_SOT_Ratio`
)).*;
