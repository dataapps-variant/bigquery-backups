-- job_id: script_job_f2029d966edda68ee459df185d4e7f53_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:00:10.081000+00:00
-- started: 2026-07-28T09:00:10.095000+00:00
-- ended: 2026-07-28T09:00:10.156000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    CONCAT(
      "SUM(`", month_str, "`) AS `", month_str, "`"
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
