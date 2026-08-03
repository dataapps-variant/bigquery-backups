-- job_id: script_job_9b841a92da102fd1d228c297632009c2_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:15:05.838000+00:00
-- started: 2026-07-29T08:15:05.852000+00:00
-- ended: 2026-07-29T08:15:05.998000+00:00

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
