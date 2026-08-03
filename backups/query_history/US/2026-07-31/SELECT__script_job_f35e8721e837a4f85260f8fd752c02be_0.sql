-- job_id: script_job_f35e8721e837a4f85260f8fd752c02be_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:00:15.041000+00:00
-- started: 2026-07-31T09:00:15.060000+00:00
-- ended: 2026-07-31T09:00:15.344000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    CONCAT("'", FORMAT_DATE('%-m-%-d-%Y', month_date), "'"),
    ', ' ORDER BY month_date
  )
  FROM UNNEST(GENERATE_DATE_ARRAY(min_month, max_month, INTERVAL 1 MONTH)) AS month_date
)).*;
