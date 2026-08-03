-- job_id: script_job_a0bbb4962ca6bb8faa84715ba7bfeed3_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:28:04.802000+00:00
-- started: 2026-07-30T09:28:04.812000+00:00
-- ended: 2026-07-30T09:28:04.895000+00:00

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
