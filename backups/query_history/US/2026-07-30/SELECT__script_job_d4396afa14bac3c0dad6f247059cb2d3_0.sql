-- job_id: script_job_d4396afa14bac3c0dad6f247059cb2d3_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:00:10.477000+00:00
-- started: 2026-07-30T09:00:10.495000+00:00
-- ended: 2026-07-30T09:00:10.564000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    CONCAT("'", FORMAT_DATE('%-m-%-d-%Y', month_date), "'"),
    ', ' ORDER BY month_date
  )
  FROM UNNEST(GENERATE_DATE_ARRAY(min_month, max_month, INTERVAL 1 MONTH)) AS month_date
)).*;
