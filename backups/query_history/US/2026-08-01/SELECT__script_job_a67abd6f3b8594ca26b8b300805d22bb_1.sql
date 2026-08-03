-- job_id: script_job_a67abd6f3b8594ca26b8b300805d22bb_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:00:05.579000+00:00
-- started: 2026-08-01T09:00:05.590000+00:00
-- ended: 2026-08-01T09:00:05.744000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    CONCAT(
      "MAX(CASE WHEN Current_Month = '", month_str, "' THEN retained_users ELSE NULL END) AS `", month_str, "`"
    ),
    ',\n    ' ORDER BY month_date
  )
  FROM (
    SELECT 
      month_date,
      FORMAT_DATE('%m-01-%Y', month_date) AS month_str
    FROM UNNEST(GENERATE_DATE_ARRAY(GREATEST(min_month, DATE '2023-01-01'), max_month, INTERVAL 1 MONTH)) AS month_date
  )
)).*;
