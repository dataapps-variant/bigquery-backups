-- job_id: script_job_7bef3b99e2900457971f0a49b0bb62e2_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:32:16.341000+00:00
-- started: 2026-07-30T09:32:16.382000+00:00
-- ended: 2026-07-30T09:32:16.747000+00:00

SELECT STRUCT<ARRAY<DATE>>(GENERATE_DATE_ARRAY(month_start, DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 1 MONTH)).*;
