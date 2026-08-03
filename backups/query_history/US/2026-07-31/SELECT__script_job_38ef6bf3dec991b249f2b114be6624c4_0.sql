-- job_id: script_job_38ef6bf3dec991b249f2b114be6624c4_0
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:47:36.350000+00:00
-- started: 2026-07-31T12:47:36.367000+00:00
-- ended: 2026-07-31T12:47:36.441000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    CONCAT("'", FORMAT_DATE('%-m-%-d-%Y', month_date), "'"),
    ', ' ORDER BY month_date
  )
  FROM UNNEST(GENERATE_DATE_ARRAY(min_month, max_month, INTERVAL 1 MONTH)) AS month_date
)).*;
