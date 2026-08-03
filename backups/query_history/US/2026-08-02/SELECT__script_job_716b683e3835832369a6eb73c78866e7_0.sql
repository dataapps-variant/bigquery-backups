-- job_id: script_job_716b683e3835832369a6eb73c78866e7_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:00:19.800000+00:00
-- started: 2026-08-02T09:00:19.821000+00:00
-- ended: 2026-08-02T09:00:19.991000+00:00

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
