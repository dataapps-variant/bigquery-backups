-- job_id: script_job_9237ff153492badf496435da814f99f4_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:15:04.513000+00:00
-- started: 2026-07-31T08:15:04.537000+00:00
-- ended: 2026-07-31T08:15:04.731000+00:00

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
