-- job_id: script_job_eb6bb5c8ec725fa3eaeffaf2413f9c54_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:00:07.940000+00:00
-- started: 2026-07-28T09:00:07.952000+00:00
-- ended: 2026-07-28T09:00:08.002000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    CONCAT("'", FORMAT_DATE('%-m-%-d-%Y', month_date), "'"),
    ', ' ORDER BY month_date
  )
  FROM UNNEST(GENERATE_DATE_ARRAY(min_month, max_month, INTERVAL 1 MONTH)) AS month_date
)).*;
