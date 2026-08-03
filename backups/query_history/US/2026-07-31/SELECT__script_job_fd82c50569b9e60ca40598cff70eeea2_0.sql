-- job_id: script_job_fd82c50569b9e60ca40598cff70eeea2_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:00:15.527000+00:00
-- started: 2026-07-31T09:00:15.536000+00:00
-- ended: 2026-07-31T09:00:15.602000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    CONCAT("'", FORMAT_DATE('%-m-%-d-%Y', month_date), "'"),
    ', ' ORDER BY month_date
  )
  FROM UNNEST(GENERATE_DATE_ARRAY(min_month, max_month, INTERVAL 1 MONTH)) AS month_date
)).*;
