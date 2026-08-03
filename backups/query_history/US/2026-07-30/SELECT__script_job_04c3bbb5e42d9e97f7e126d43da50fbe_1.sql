-- job_id: script_job_04c3bbb5e42d9e97f7e126d43da50fbe_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:06.882000+00:00
-- started: 2026-07-30T08:45:06.954000+00:00
-- ended: 2026-07-30T08:45:07.164000+00:00

SELECT STRUCT<DATE>((
  SELECT COALESCE(MAX(Report_date), fallback_date)
  FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Crystal_Ball`
)).*;
