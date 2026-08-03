-- job_id: script_job_d73f911f5f27aebf0d72fca069e2e430_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:30:08.900000+00:00
-- started: 2026-07-30T09:30:09.007000+00:00
-- ended: 2026-07-30T09:30:09.292000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU_Merged.Refund_Table`
)).*;
