-- job_id: script_job_e8e287ab376a2de85e4fa5353e6d33e7_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:00:05.967000+00:00
-- started: 2026-08-01T09:00:05.976000+00:00
-- ended: 2026-08-01T09:00:06.111000+00:00

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
