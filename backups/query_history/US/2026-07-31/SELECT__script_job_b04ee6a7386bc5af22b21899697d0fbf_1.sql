-- job_id: script_job_b04ee6a7386bc5af22b21899697d0fbf_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:30:06.266000+00:00
-- started: 2026-07-31T08:30:06.341000+00:00
-- ended: 2026-07-31T08:30:06.584000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID`
)).*;
