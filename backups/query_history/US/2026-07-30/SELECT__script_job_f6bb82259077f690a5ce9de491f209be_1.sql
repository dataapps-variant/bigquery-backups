-- job_id: script_job_f6bb82259077f690a5ce9de491f209be_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:30:07.901000+00:00
-- started: 2026-07-30T08:30:07.991000+00:00
-- ended: 2026-07-30T08:30:08.242000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`
)).*;
