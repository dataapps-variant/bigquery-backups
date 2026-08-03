-- job_id: script_job_eefecff1127e1dbc562bf75178d71a4a_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:00:01.911000+00:00
-- started: 2026-08-01T09:00:01.949000+00:00
-- ended: 2026-08-01T09:00:02.125000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    CONCAT("'", FORMAT_DATE('%-m-%-d-%Y', month_date), "'"),
    ', ' ORDER BY month_date
  )
  FROM UNNEST(GENERATE_DATE_ARRAY(min_month, max_month, INTERVAL 1 MONTH)) AS month_date
)).*;
