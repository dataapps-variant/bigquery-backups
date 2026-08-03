-- job_id: script_job_f884520d76c5b829ba6bfedadeeb5884_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:06.408000+00:00
-- started: 2026-07-30T08:45:06.491000+00:00
-- ended: 2026-07-30T08:45:06.678000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Main_Table_AFID`
)).*;
