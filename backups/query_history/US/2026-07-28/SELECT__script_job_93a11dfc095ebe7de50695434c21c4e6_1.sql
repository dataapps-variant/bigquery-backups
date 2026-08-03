-- job_id: script_job_93a11dfc095ebe7de50695434c21c4e6_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T12:33:26.928000+00:00
-- started: 2026-07-28T12:33:26.993000+00:00
-- ended: 2026-07-28T12:33:27.084000+00:00

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
