-- job_id: script_job_3ec73a550920a92b358f4ca668b948de_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:15:05.255000+00:00
-- started: 2026-07-29T08:15:05.268000+00:00
-- ended: 2026-07-29T08:15:05.598000+00:00

SELECT STRUCT<ARRAY<DATE>>(GENERATE_DATE_ARRAY(month_start, DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 1 MONTH)).*;
