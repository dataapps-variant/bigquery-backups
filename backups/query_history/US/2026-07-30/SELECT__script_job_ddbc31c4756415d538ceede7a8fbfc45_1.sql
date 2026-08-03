-- job_id: script_job_ddbc31c4756415d538ceede7a8fbfc45_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:09.180000+00:00
-- started: 2026-07-30T08:45:09.273000+00:00
-- ended: 2026-07-30T08:45:09.508000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table`
)).*;
