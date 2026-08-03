-- job_id: script_job_a8fba62e52cd91806ae1009cfcf57b7c_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:15:03.945000+00:00
-- started: 2026-08-01T08:15:03.955000+00:00
-- ended: 2026-08-01T08:15:04.080000+00:00

SELECT STRUCT<STRING>((
  SELECT CONCAT(
    '(',
    STRING_AGG(FORMAT_DATE('`%b_%Y`', m), ' + '),
    ') > 50'
  )
  FROM UNNEST(months_array) AS m
  WHERE m >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 2 MONTH)
)).*;
