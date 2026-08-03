-- job_id: script_job_e6edd5a933a2d20df56927525e914b84_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:32:16.984000+00:00
-- started: 2026-07-30T09:32:17.012000+00:00
-- ended: 2026-07-30T09:32:17.100000+00:00

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
