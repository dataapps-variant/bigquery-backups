-- job_id: script_job_cb020b17334c7ac03ab8e7aa31dffaf7_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:03.626000+00:00
-- started: 2026-08-02T08:45:03.707000+00:00
-- ended: 2026-08-02T08:45:03.979000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball`
)).*;
