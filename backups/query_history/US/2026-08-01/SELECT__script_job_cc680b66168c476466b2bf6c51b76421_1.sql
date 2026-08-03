-- job_id: script_job_cc680b66168c476466b2bf6c51b76421_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:15:03.513000+00:00
-- started: 2026-08-01T08:15:03.523000+00:00
-- ended: 2026-08-01T08:15:03.669000+00:00

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
