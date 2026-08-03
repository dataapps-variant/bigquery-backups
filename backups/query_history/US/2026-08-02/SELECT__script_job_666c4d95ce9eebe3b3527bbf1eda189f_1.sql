-- job_id: script_job_666c4d95ce9eebe3b3527bbf1eda189f_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:00:14.371000+00:00
-- started: 2026-08-02T09:00:14.388000+00:00
-- ended: 2026-08-02T09:00:14.591000+00:00

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
