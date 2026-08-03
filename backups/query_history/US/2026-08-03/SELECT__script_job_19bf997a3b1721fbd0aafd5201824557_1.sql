-- job_id: script_job_19bf997a3b1721fbd0aafd5201824557_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:30:09.448000+00:00
-- started: 2026-08-03T08:30:09.567000+00:00
-- ended: 2026-08-03T08:30:09.904000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.Icarus_Cohort.IC_Refund_Table_AFID`
)).*;
