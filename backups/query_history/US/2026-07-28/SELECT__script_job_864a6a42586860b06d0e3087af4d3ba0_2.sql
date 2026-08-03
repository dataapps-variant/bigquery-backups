-- job_id: script_job_864a6a42586860b06d0e3087af4d3ba0_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T12:33:27.326000+00:00
-- started: 2026-07-28T12:33:27.335000+00:00
-- ended: 2026-07-28T12:33:27.466000+00:00

SELECT STRUCT<STRING>((
  SELECT CONCAT(
    '(',
    STRING_AGG(FORMAT_DATE('`%b_%Y`', m), ' + '),
    ') > 50'
  )
  FROM UNNEST(months_array) AS m
  WHERE m >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 2 MONTH)
)).*;
