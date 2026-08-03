-- job_id: script_job_61df238370bfe2ba8f6c003e6228f248_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T12:44:07.896000+00:00
-- started: 2026-07-31T12:44:07.912000+00:00
-- ended: 2026-07-31T12:44:07.970000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    CONCAT("'", FORMAT_DATE('%-m-%-d-%Y', month_date), "'"),
    ', ' ORDER BY month_date
  )
  FROM UNNEST(GENERATE_DATE_ARRAY(min_month, max_month, INTERVAL 1 MONTH)) AS month_date
)).*;
