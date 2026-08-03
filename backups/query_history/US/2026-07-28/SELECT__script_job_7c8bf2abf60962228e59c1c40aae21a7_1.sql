-- job_id: script_job_7c8bf2abf60962228e59c1c40aae21a7_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:05.084000+00:00
-- started: 2026-07-28T08:45:05.138000+00:00
-- ended: 2026-07-28T08:45:05.354000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_30D_Main_Table`
)).*;
