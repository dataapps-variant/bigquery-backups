-- job_id: script_job_05513fc6a2bc7fde8afaa203cae51a04_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:00:11.900000+00:00
-- started: 2026-08-03T09:00:11.932000+00:00
-- ended: 2026-08-03T09:00:12.149000+00:00

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
