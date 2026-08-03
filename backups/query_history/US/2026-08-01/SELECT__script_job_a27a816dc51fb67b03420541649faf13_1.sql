-- job_id: script_job_a27a816dc51fb67b03420541649faf13_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:30:09.646000+00:00
-- started: 2026-08-01T08:30:09.757000+00:00
-- ended: 2026-08-01T08:30:09.981000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.VPU.15K_SOT_Ratio`
)).*;
