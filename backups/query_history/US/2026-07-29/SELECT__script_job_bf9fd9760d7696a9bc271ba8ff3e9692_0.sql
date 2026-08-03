-- job_id: script_job_bf9fd9760d7696a9bc271ba8ff3e9692_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:00:13.913000+00:00
-- started: 2026-07-29T09:00:13.939000+00:00
-- ended: 2026-07-29T09:00:14.125000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    CONCAT("'", FORMAT_DATE('%-m-%-d-%Y', month_date), "'"),
    ', ' ORDER BY month_date
  )
  FROM UNNEST(GENERATE_DATE_ARRAY(min_month, max_month, INTERVAL 1 MONTH)) AS month_date
)).*;
