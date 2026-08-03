-- job_id: script_job_16a0eccedeed55d520bf34c123687ab0_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:00:05.715000+00:00
-- started: 2026-08-03T09:00:05.734000+00:00
-- ended: 2026-08-03T09:00:11.394000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    CONCAT("'", FORMAT_DATE('%-m-%-d-%Y', month_date), "'"),
    ', ' ORDER BY month_date
  )
  FROM UNNEST(GENERATE_DATE_ARRAY(min_month, max_month, INTERVAL 1 MONTH)) AS month_date
)).*;
