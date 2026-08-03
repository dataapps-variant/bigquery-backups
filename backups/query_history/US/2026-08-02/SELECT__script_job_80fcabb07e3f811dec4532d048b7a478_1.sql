-- job_id: script_job_80fcabb07e3f811dec4532d048b7a478_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:15:03.863000+00:00
-- started: 2026-08-02T08:15:03.880000+00:00
-- ended: 2026-08-02T08:15:04.024000+00:00

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
