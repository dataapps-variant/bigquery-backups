-- job_id: script_job_512e71ce7836cbcc3a5e700a6d7fd1dc_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T12:27:28.545000+00:00
-- started: 2026-07-28T12:27:28.558000+00:00
-- ended: 2026-07-28T12:27:28.701000+00:00

SELECT STRUCT<STRING>((
  SELECT CONCAT(
    '(',
    STRING_AGG(FORMAT_DATE('`%b_%Y`', m), ' + '),
    ') > 50'
  )
  FROM UNNEST(months_array) AS m
  WHERE m >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 2 MONTH)
)).*;
