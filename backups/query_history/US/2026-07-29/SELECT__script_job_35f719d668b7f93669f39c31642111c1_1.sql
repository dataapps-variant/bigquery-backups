-- job_id: script_job_35f719d668b7f93669f39c31642111c1_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:08.002000+00:00
-- started: 2026-07-29T08:45:08.094000+00:00
-- ended: 2026-07-29T08:45:08.256000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`
)).*;
