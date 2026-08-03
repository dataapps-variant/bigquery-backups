-- job_id: script_job_3ce2fca083159fe600a04b7615bcc1a9_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:28:05.093000+00:00
-- started: 2026-07-30T09:28:05.104000+00:00
-- ended: 2026-07-30T09:28:05.272000+00:00

SELECT STRUCT<STRING>((
  SELECT CONCAT(
    '(',
    STRING_AGG(FORMAT_DATE('`%b_%Y`', m), ' + '),
    ') > 50'
  )
  FROM UNNEST(months_array) AS m
  WHERE m >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 2 MONTH)
)).*;
