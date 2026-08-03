-- job_id: script_job_fd3bb929f71217c2256d99c65f46e2f5_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:15:02.452000+00:00
-- started: 2026-08-03T08:15:02.477000+00:00
-- ended: 2026-08-03T08:15:02.589000+00:00

SELECT STRUCT<STRING>((
  SELECT CONCAT(
    '(',
    STRING_AGG(FORMAT_DATE('`%b_%Y`', m), ' + '),
    ') > 50'
  )
  FROM UNNEST(months_array) AS m
  WHERE m >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 2 MONTH)
)).*;
