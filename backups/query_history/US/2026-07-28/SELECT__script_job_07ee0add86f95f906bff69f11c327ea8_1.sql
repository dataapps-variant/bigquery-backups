-- job_id: script_job_07ee0add86f95f906bff69f11c327ea8_1
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:52:05.688000+00:00
-- started: 2026-07-28T11:52:05.705000+00:00
-- ended: 2026-07-28T11:52:05.780000+00:00

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
