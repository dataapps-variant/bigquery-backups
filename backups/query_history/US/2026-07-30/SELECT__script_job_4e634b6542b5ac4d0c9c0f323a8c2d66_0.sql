-- job_id: script_job_4e634b6542b5ac4d0c9c0f323a8c2d66_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:00:07.143000+00:00
-- started: 2026-07-30T09:00:07.157000+00:00
-- ended: 2026-07-30T09:00:07.247000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    CONCAT("'", FORMAT_DATE('%-m-%-d-%Y', month_date), "'"),
    ', ' ORDER BY month_date
  )
  FROM UNNEST(GENERATE_DATE_ARRAY(min_month, max_month, INTERVAL 1 MONTH)) AS month_date
)).*;
