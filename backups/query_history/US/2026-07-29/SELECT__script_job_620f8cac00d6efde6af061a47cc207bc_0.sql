-- job_id: script_job_620f8cac00d6efde6af061a47cc207bc_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T17:19:55.074000+00:00
-- started: 2026-07-29T17:19:55.089000+00:00
-- ended: 2026-07-29T17:19:55.919000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    FORMAT(
      "SUM(CASE WHEN DATE_TRUNC(Date, MONTH) = '%s' THEN allocated_spend ELSE 0 END) AS `%s`",
      FORMAT_DATE('%Y-%m-%d', month_start),
      FORMAT_DATE('%b_%Y', month_start)
    ),
    ',\n    '
    ORDER BY month_start
  )
  FROM UNNEST(
    GENERATE_DATE_ARRAY(
      DATE_TRUNC(start_date, MONTH),
      DATE_TRUNC(end_date, MONTH),
      INTERVAL 1 MONTH
    )
  ) AS month_start
)).*;
