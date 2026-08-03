-- job_id: script_job_5d34c22ed4e2cc4c4c2ad6285b89e919_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:50:38.550000+00:00
-- started: 2026-07-28T11:50:38.566000+00:00
-- ended: 2026-07-28T11:50:38.634000+00:00

SELECT STRUCT<ARRAY<DATE>>(GENERATE_DATE_ARRAY(month_start, DATE_SUB(month_end, INTERVAL 1 DAY), INTERVAL 1 MONTH)).*;
