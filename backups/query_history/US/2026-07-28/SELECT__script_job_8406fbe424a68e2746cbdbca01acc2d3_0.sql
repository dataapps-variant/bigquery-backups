-- job_id: script_job_8406fbe424a68e2746cbdbca01acc2d3_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:00:07.216000+00:00
-- started: 2026-07-28T09:00:07.331000+00:00
-- ended: 2026-07-28T09:00:07.407000+00:00

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
