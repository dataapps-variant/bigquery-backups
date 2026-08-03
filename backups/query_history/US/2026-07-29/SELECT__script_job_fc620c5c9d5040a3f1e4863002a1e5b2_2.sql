-- job_id: script_job_fc620c5c9d5040a3f1e4863002a1e5b2_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:15:06.242000+00:00
-- started: 2026-07-29T08:15:06.254000+00:00
-- ended: 2026-07-29T08:15:06.404000+00:00

SELECT STRUCT<STRING>((
  SELECT CONCAT(
    '(',
    STRING_AGG(FORMAT_DATE('`%b_%Y`', m), ' + '),
    ') > 50'
  )
  FROM UNNEST(months_array) AS m
  WHERE m >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 2 MONTH)
)).*;
