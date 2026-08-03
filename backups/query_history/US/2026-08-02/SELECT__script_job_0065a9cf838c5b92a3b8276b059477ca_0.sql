-- job_id: script_job_0065a9cf838c5b92a3b8276b059477ca_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:00:04.022000+00:00
-- started: 2026-08-02T09:00:04.036000+00:00
-- ended: 2026-08-02T09:00:04.182000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    CONCAT("'", FORMAT_DATE('%-m-%-d-%Y', month_date), "'"),
    ', ' ORDER BY month_date
  )
  FROM UNNEST(GENERATE_DATE_ARRAY(min_month, max_month, INTERVAL 1 MONTH)) AS month_date
)).*;
