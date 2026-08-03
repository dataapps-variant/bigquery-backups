-- job_id: script_job_c4acbdda3fe1e6d3c9b249fe92f05ded_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:30:12.063000+00:00
-- started: 2026-07-28T08:30:12.221000+00:00
-- ended: 2026-07-28T08:30:12.503000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID`
)).*;
