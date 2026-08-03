-- job_id: script_job_c21b86e7fbd41ffaab28c4a9b94106e1_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:30:07.041000+00:00
-- started: 2026-08-01T09:30:07.362000+00:00
-- ended: 2026-08-01T09:30:07.573000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.Refund_Table`
)).*;
