-- job_id: script_job_de5c7baad1d0916b5c41b9192c2dd0e7_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:15:04.964000+00:00
-- started: 2026-07-30T08:15:04.992000+00:00
-- ended: 2026-07-30T08:15:05.833000+00:00

SELECT STRUCT<ARRAY<DATE>>(GENERATE_DATE_ARRAY(month_start, DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 1 MONTH)).*;
