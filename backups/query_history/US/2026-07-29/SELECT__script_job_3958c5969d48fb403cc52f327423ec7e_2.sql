-- job_id: script_job_3958c5969d48fb403cc52f327423ec7e_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:00:24.727000+00:00
-- started: 2026-07-29T09:00:24.744000+00:00
-- ended: 2026-07-29T09:00:25.022000+00:00

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
