-- job_id: script_job_6ea7b1c15a60368b82796aee2141ec9f_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:50:39.173000+00:00
-- started: 2026-07-28T11:50:39.186000+00:00
-- ended: 2026-07-28T11:50:39.257000+00:00

SELECT STRUCT<STRING>((
  SELECT CONCAT(
    '(',
    STRING_AGG(FORMAT_DATE('`%b_%Y`', m), ' + '),
    ') > 50'
  )
  FROM UNNEST(months_array) AS m
  WHERE m >= DATE_SUB(month_end, INTERVAL 3 MONTH)
)).*;
