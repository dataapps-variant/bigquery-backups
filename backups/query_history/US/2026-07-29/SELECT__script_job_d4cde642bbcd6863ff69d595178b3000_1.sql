-- job_id: script_job_d4cde642bbcd6863ff69d595178b3000_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:05.384000+00:00
-- started: 2026-07-29T08:45:05.584000+00:00
-- ended: 2026-07-29T08:45:05.826000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`
)).*;
