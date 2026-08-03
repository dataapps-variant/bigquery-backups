-- job_id: script_job_d11a29e2fa5710bb63b8a4129c6da3e7_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:52:20.453000+00:00
-- started: 2026-07-28T11:52:20.466000+00:00
-- ended: 2026-07-28T11:52:20.523000+00:00

SELECT STRUCT<ARRAY<DATE>>(GENERATE_DATE_ARRAY(month_start, DATE_SUB(month_end, INTERVAL 1 DAY), INTERVAL 1 MONTH)).*;
