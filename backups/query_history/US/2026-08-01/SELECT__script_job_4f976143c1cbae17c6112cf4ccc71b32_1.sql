-- job_id: script_job_4f976143c1cbae17c6112cf4ccc71b32_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:30:04.828000+00:00
-- started: 2026-08-01T08:30:04.892000+00:00
-- ended: 2026-08-01T08:30:05.095000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID`
)).*;
