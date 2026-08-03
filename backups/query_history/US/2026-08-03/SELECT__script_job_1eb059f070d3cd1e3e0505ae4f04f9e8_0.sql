-- job_id: script_job_1eb059f070d3cd1e3e0505ae4f04f9e8_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:15:01.673000+00:00
-- started: 2026-08-03T08:15:01.690000+00:00
-- ended: 2026-08-03T08:15:01.828000+00:00

SELECT STRUCT<ARRAY<DATE>>(GENERATE_DATE_ARRAY(month_start, DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 1 MONTH)).*;
