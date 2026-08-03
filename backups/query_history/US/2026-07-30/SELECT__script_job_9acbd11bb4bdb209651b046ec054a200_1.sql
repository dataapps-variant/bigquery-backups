-- job_id: script_job_9acbd11bb4bdb209651b046ec054a200_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:09.218000+00:00
-- started: 2026-07-30T08:45:09.331000+00:00
-- ended: 2026-07-30T08:45:09.515000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_7K_Crystal_Ball_AFID`
)).*;
