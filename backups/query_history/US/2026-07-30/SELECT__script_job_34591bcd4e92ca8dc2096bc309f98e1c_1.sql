-- job_id: script_job_34591bcd4e92ca8dc2096bc309f98e1c_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:07.298000+00:00
-- started: 2026-07-30T08:45:07.383000+00:00
-- ended: 2026-07-30T08:45:07.595000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Crystal_Ball_MP`
)).*;
