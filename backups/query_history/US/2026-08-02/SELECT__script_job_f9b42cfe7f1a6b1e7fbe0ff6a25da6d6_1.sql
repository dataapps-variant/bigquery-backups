-- job_id: script_job_f9b42cfe7f1a6b1e7fbe0ff6a25da6d6_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:03.453000+00:00
-- started: 2026-08-02T08:45:03.544000+00:00
-- ended: 2026-08-02T08:45:03.781000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table_300`
)).*;
