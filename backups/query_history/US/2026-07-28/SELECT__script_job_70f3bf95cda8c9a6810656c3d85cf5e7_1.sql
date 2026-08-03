-- job_id: script_job_70f3bf95cda8c9a6810656c3d85cf5e7_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T12:27:28.139000+00:00
-- started: 2026-07-28T12:27:28.147000+00:00
-- ended: 2026-07-28T12:27:28.310000+00:00

SELECT STRUCT<STRING>((
  SELECT STRING_AGG(
    FORMAT(
      "COUNT(DISTINCT CASE WHEN FORMAT_DATE('%%Y-%%m', Date_of_Sale) = '%s' THEN Updated_Cust_ID END) AS %s",
      FORMAT_DATE('%Y-%m', m),
      FORMAT_DATE('`%b_%Y`', m)
    ),
    ',\n    '
  )
  FROM UNNEST(months_array) AS m
)).*;
