-- job_id: script_job_3c0b6fa727aaa00a32f6995c1574779e_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:15:02.125000+00:00
-- started: 2026-08-03T08:15:02.138000+00:00
-- ended: 2026-08-03T08:15:02.241000+00:00

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
