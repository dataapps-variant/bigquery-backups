-- job_id: script_job_557c9e3689116a442cef799d9f8a7ac4_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:07.232000+00:00
-- started: 2026-07-29T08:45:07.312000+00:00
-- ended: 2026-07-29T08:45:07.578000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball_AFID`
)).*;
