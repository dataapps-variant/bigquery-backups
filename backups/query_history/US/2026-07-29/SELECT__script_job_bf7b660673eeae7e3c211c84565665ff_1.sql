-- job_id: script_job_bf7b660673eeae7e3c211c84565665ff_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:04.036000+00:00
-- started: 2026-07-29T08:45:04.109000+00:00
-- ended: 2026-07-29T08:45:04.349000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table_300`
)).*;
