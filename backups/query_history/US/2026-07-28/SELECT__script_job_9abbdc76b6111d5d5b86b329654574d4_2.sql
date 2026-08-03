-- job_id: script_job_9abbdc76b6111d5d5b86b329654574d4_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:52:21.104000+00:00
-- started: 2026-07-28T11:52:21.114000+00:00
-- ended: 2026-07-28T11:52:21.176000+00:00

SELECT STRUCT<STRING>((
  SELECT CONCAT(
    '(',
    STRING_AGG(FORMAT_DATE('`%b_%Y`', m), ' + '),
    ') > 50'
  )
  FROM UNNEST(months_array) AS m
  WHERE m >= DATE_SUB(month_end, INTERVAL 3 MONTH)
)).*;
