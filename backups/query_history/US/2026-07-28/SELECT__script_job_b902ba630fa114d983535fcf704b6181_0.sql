-- job_id: script_job_b902ba630fa114d983535fcf704b6181_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:15:02.440000+00:00
-- started: 2026-07-28T08:15:02.453000+00:00
-- ended: 2026-07-28T08:15:02.594000+00:00

SELECT STRUCT<ARRAY<DATE>>(GENERATE_DATE_ARRAY(month_start, DATE_SUB(month_end, INTERVAL 1 DAY), INTERVAL 1 MONTH)).*;
