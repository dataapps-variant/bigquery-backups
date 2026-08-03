-- job_id: script_job_81d8fc46e426b099556300f70847383d_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T12:43:52.207000+00:00
-- started: 2026-07-31T12:43:52.219000+00:00
-- ended: 2026-07-31T12:43:52.302000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    CONCAT("'", FORMAT_DATE('%-m-%-d-%Y', month_date), "'"),
    ', ' ORDER BY month_date
  )
  FROM UNNEST(GENERATE_DATE_ARRAY(min_month, max_month, INTERVAL 1 MONTH)) AS month_date
)).*;
