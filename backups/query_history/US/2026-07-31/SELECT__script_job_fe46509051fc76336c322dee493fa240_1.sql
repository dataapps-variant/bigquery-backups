-- job_id: script_job_fe46509051fc76336c322dee493fa240_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:00:15.933000+00:00
-- started: 2026-07-31T09:00:15.954000+00:00
-- ended: 2026-07-31T09:00:16.183000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    CONCAT(
      "MAX(CASE WHEN Current_Month = '", month_str, "' THEN refunded_users ELSE NULL END) AS `", month_str, "`"
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
