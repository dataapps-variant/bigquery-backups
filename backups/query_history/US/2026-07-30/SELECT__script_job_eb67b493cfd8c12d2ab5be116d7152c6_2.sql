-- job_id: script_job_eb67b493cfd8c12d2ab5be116d7152c6_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:00:09.995000+00:00
-- started: 2026-07-30T09:00:10.009000+00:00
-- ended: 2026-07-30T09:00:10.094000+00:00

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
