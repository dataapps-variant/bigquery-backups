-- job_id: script_job_9cf7abaf5c2053789cf93733a9d8aa02_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:15:06.656000+00:00
-- started: 2026-07-30T08:15:06.671000+00:00
-- ended: 2026-07-30T08:15:07.763000+00:00

SELECT STRUCT<STRING>((
  SELECT CONCAT(
    '(',
    STRING_AGG(FORMAT_DATE('`%b_%Y`', m), ' + '),
    ') > 50'
  )
  FROM UNNEST(months_array) AS m
  WHERE m >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 2 MONTH)
)).*;
