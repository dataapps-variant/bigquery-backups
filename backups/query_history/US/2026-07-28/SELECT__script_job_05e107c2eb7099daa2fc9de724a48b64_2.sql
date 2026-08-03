-- job_id: script_job_05e107c2eb7099daa2fc9de724a48b64_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:52:06.063000+00:00
-- started: 2026-07-28T11:52:06.097000+00:00
-- ended: 2026-07-28T11:52:06.168000+00:00

SELECT STRUCT<STRING>((
  SELECT CONCAT(
    '(',
    STRING_AGG(FORMAT_DATE('`%b_%Y`', m), ' + '),
    ') > 50'
  )
  FROM UNNEST(months_array) AS m
  WHERE m >= DATE_SUB(month_end, INTERVAL 3 MONTH)
)).*;
