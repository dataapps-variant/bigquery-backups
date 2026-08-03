-- job_id: script_job_6850502f07f1547810d9fd13288ff5cc_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:05.466000+00:00
-- started: 2026-07-28T08:45:05.524000+00:00
-- ended: 2026-07-28T08:45:05.692000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball_AFID`
)).*;
