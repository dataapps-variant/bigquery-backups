-- job_id: script_job_322c13a65d1f328abedcdc72c4c402c2_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:06.087000+00:00
-- started: 2026-07-28T08:45:06.162000+00:00
-- ended: 2026-07-28T08:45:06.378000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table_MP`
)).*;
