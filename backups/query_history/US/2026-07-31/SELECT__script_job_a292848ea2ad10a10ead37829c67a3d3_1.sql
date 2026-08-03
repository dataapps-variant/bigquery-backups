-- job_id: script_job_a292848ea2ad10a10ead37829c67a3d3_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:05.748000+00:00
-- started: 2026-07-31T08:45:05.809000+00:00
-- ended: 2026-07-31T08:45:06.022000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Crystal_Ball`
)).*;
