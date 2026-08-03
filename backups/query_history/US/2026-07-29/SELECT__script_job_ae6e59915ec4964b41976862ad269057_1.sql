-- job_id: script_job_ae6e59915ec4964b41976862ad269057_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:30:09.759000+00:00
-- started: 2026-07-29T08:30:09.841000+00:00
-- ended: 2026-07-29T08:30:10.039000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID`
)).*;
