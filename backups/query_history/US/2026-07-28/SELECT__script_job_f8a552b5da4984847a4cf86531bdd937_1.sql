-- job_id: script_job_f8a552b5da4984847a4cf86531bdd937_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:00:09.772000+00:00
-- started: 2026-07-28T09:00:09.784000+00:00
-- ended: 2026-07-28T09:00:09.876000+00:00

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
