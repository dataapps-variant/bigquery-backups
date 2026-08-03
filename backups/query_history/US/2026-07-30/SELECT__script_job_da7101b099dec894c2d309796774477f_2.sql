-- job_id: script_job_da7101b099dec894c2d309796774477f_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:32:17.352000+00:00
-- started: 2026-07-30T09:32:17.373000+00:00
-- ended: 2026-07-30T09:32:17.519000+00:00

SELECT STRUCT<STRING>((
  SELECT CONCAT(
    '(',
    STRING_AGG(FORMAT_DATE('`%b_%Y`', m), ' + '),
    ') > 50'
  )
  FROM UNNEST(months_array) AS m
  WHERE m >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 2 MONTH)
)).*;
