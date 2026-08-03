-- job_id: script_job_57211cdb6831a8492e227493ec15b9fc_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:00:06.498000+00:00
-- started: 2026-07-28T09:00:06.524000+00:00
-- ended: 2026-07-28T09:00:06.603000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    CONCAT("'", FORMAT_DATE('%-m-%-d-%Y', month_date), "'"),
    ', ' ORDER BY month_date
  )
  FROM UNNEST(GENERATE_DATE_ARRAY(min_month, max_month, INTERVAL 1 MONTH)) AS month_date
)).*;
