-- job_id: script_job_f980c0809c3264cf08dc72ddda509bb1_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:06.334000+00:00
-- started: 2026-07-31T08:45:06.412000+00:00
-- ended: 2026-07-31T08:45:06.594000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_Crystal_Ball`
)).*;
