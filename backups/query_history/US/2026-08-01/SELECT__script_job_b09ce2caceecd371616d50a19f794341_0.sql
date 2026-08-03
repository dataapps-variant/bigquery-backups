-- job_id: script_job_b09ce2caceecd371616d50a19f794341_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:15:03.097000+00:00
-- started: 2026-08-01T08:15:03.112000+00:00
-- ended: 2026-08-01T08:15:03.255000+00:00

SELECT STRUCT<ARRAY<DATE>>(GENERATE_DATE_ARRAY(month_start, DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 1 MONTH)).*;
