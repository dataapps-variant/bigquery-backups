-- job_id: script_job_98532783558f113972b138950daa2d9d_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:00:10.852000+00:00
-- started: 2026-08-02T09:00:10.869000+00:00
-- ended: 2026-08-02T09:00:10.929000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    CONCAT("'", FORMAT_DATE('%-m-%-d-%Y', month_date), "'"),
    ', ' ORDER BY month_date
  )
  FROM UNNEST(GENERATE_DATE_ARRAY(min_month, max_month, INTERVAL 1 MONTH)) AS month_date
)).*;
