-- job_id: script_job_7450f9c13826c584806fab09dc322efa_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:07.440000+00:00
-- started: 2026-07-30T08:45:07.506000+00:00
-- ended: 2026-07-30T08:45:07.694000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table`
)).*;
