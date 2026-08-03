-- job_id: script_job_21ae296e704e6de1d2fde819365812c6_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:52:05.371000+00:00
-- started: 2026-07-28T11:52:05.381000+00:00
-- ended: 2026-07-28T11:52:05.442000+00:00

SELECT STRUCT<ARRAY<DATE>>(GENERATE_DATE_ARRAY(month_start, DATE_SUB(month_end, INTERVAL 1 DAY), INTERVAL 1 MONTH)).*;
