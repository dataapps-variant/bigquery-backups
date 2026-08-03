-- job_id: script_job_301e223cfadd02622c1e84492aa2444e_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:07.592000+00:00
-- started: 2026-07-30T08:45:07.717000+00:00
-- ended: 2026-07-30T08:45:07.927000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`
)).*;
