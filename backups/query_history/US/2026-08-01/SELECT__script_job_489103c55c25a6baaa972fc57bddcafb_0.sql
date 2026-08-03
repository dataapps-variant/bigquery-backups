-- job_id: script_job_489103c55c25a6baaa972fc57bddcafb_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:00:03.125000+00:00
-- started: 2026-08-01T09:00:03.135000+00:00
-- ended: 2026-08-01T09:00:03.193000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    CONCAT("'", FORMAT_DATE('%-m-%-d-%Y', month_date), "'"),
    ', ' ORDER BY month_date
  )
  FROM UNNEST(GENERATE_DATE_ARRAY(min_month, max_month, INTERVAL 1 MONTH)) AS month_date
)).*;
