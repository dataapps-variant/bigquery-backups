-- job_id: script_job_8ddffc865e2daffe62a0c37e895f5baa_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:06.656000+00:00
-- started: 2026-08-01T08:45:06.744000+00:00
-- ended: 2026-08-01T08:45:06.929000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table`
)).*;
