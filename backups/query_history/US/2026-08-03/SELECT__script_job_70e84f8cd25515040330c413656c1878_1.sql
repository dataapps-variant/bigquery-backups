-- job_id: script_job_70e84f8cd25515040330c413656c1878_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:03.103000+00:00
-- started: 2026-08-03T08:45:03.168000+00:00
-- ended: 2026-08-03T08:45:03.334000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_Main_Table`
)).*;
