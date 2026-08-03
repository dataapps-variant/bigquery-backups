-- job_id: script_job_de0f5d77ee4f451d4cdf004b38aa59f7_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:00:09.635000+00:00
-- started: 2026-07-30T09:00:09.649000+00:00
-- ended: 2026-07-30T09:00:09.737000+00:00

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
