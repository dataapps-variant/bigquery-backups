-- job_id: script_job_71ab07d03021b07a6582e171ebe65f0a_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T12:27:27.760000+00:00
-- started: 2026-07-28T12:27:27.770000+00:00
-- ended: 2026-07-28T12:27:27.926000+00:00

SELECT STRUCT<ARRAY<DATE>>(GENERATE_DATE_ARRAY(month_start, DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 1 MONTH)).*;
