-- job_id: script_job_36c6e41ea461a539c9ec91635af2e202_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:15:03.418000+00:00
-- started: 2026-08-02T08:15:03.432000+00:00
-- ended: 2026-08-02T08:15:03.611000+00:00

SELECT STRUCT<ARRAY<DATE>>(GENERATE_DATE_ARRAY(month_start, DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 1 MONTH)).*;
