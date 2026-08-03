-- job_id: script_job_95e3872a4268425947a7a3f59bb1a85e_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:03.816000+00:00
-- started: 2026-08-01T08:45:03.861000+00:00
-- ended: 2026-08-01T08:45:04.060000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table_300`
)).*;
