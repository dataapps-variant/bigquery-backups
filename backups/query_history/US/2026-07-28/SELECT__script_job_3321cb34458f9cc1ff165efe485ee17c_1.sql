-- job_id: script_job_3321cb34458f9cc1ff165efe485ee17c_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:30:04.619000+00:00
-- started: 2026-07-28T08:30:04.674000+00:00
-- ended: 2026-07-28T08:30:05.045000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`
)).*;
