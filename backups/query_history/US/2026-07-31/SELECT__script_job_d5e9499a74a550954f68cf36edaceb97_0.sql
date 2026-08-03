-- job_id: script_job_d5e9499a74a550954f68cf36edaceb97_0
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T10:13:16.343000+00:00
-- started: 2026-07-31T10:13:16.373000+00:00
-- ended: 2026-07-31T10:13:16.615000+00:00

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
