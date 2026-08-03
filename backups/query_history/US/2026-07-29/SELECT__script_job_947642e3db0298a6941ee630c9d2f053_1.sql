-- job_id: script_job_947642e3db0298a6941ee630c9d2f053_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:06.663000+00:00
-- started: 2026-07-29T08:45:06.770000+00:00
-- ended: 2026-07-29T08:45:06.917000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball`
)).*;
