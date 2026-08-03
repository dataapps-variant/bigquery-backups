-- job_id: script_job_ca03cb559c09ab3971e857cdfca7c2d6_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:15:03.975000+00:00
-- started: 2026-07-31T08:15:04.026000+00:00
-- ended: 2026-07-31T08:15:04.241000+00:00

SELECT STRUCT<ARRAY<DATE>>(GENERATE_DATE_ARRAY(month_start, DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 1 MONTH)).*;
