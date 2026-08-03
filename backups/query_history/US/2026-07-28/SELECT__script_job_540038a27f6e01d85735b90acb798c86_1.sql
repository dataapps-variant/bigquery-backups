-- job_id: script_job_540038a27f6e01d85735b90acb798c86_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:05.469000+00:00
-- started: 2026-07-28T08:45:05.548000+00:00
-- ended: 2026-07-28T08:45:05.734000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table_300`
)).*;
