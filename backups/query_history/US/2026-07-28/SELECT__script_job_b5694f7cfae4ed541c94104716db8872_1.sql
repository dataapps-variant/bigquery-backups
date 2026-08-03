-- job_id: script_job_b5694f7cfae4ed541c94104716db8872_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:15:02.836000+00:00
-- started: 2026-07-28T08:15:02.850000+00:00
-- ended: 2026-07-28T08:15:02.992000+00:00

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
