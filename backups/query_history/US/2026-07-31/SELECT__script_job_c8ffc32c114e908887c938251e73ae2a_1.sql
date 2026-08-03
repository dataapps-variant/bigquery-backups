-- job_id: script_job_c8ffc32c114e908887c938251e73ae2a_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:30:04.709000+00:00
-- started: 2026-07-31T08:30:04.800000+00:00
-- ended: 2026-07-31T08:30:05.195000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`
)).*;
