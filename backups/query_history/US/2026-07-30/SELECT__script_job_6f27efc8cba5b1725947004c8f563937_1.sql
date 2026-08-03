-- job_id: script_job_6f27efc8cba5b1725947004c8f563937_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:15:06.097000+00:00
-- started: 2026-07-30T08:15:06.112000+00:00
-- ended: 2026-07-30T08:15:06.389000+00:00

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
