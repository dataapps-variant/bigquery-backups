-- job_id: script_job_c5eba7b6729cd0ccf8bc4f8ac1a0a2e5_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:00:18.148000+00:00
-- started: 2026-08-01T09:00:18.159000+00:00
-- ended: 2026-08-01T09:00:18.549000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    FORMAT(
      "SUM(CASE WHEN EXTRACT(YEAR FROM Date) = %d AND EXTRACT(MONTH FROM Date) = %d THEN allocated_spend ELSE 0 END) AS `%s`",
      EXTRACT(YEAR FROM month_date),
      EXTRACT(MONTH FROM month_date),
      FORMAT_DATE('%d-%m-%Y', month_date)
    ),
    ',\n  '
  ORDER BY month_date)
  FROM UNNEST(GENERATE_DATE_ARRAY(start_date, end_date, INTERVAL 1 MONTH)) AS month_date
)).*;
