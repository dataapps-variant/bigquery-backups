-- job_id: script_job_346042636997e0043b39079bf0d48a70_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:15:04.229000+00:00
-- started: 2026-08-02T08:15:04.242000+00:00
-- ended: 2026-08-02T08:15:04.472000+00:00

SELECT STRUCT<STRING>((
  SELECT CONCAT(
    '(',
    STRING_AGG(FORMAT_DATE('`%b_%Y`', m), ' + '),
    ') > 50'
  )
  FROM UNNEST(months_array) AS m
  WHERE m >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 2 MONTH)
)).*;
