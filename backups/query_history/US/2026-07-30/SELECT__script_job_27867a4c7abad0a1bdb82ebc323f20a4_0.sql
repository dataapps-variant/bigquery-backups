-- job_id: script_job_27867a4c7abad0a1bdb82ebc323f20a4_0
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:28:04.326000+00:00
-- started: 2026-07-30T09:28:04.343000+00:00
-- ended: 2026-07-30T09:28:04.509000+00:00

SELECT STRUCT<ARRAY<DATE>>(GENERATE_DATE_ARRAY(month_start, DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 1 MONTH)).*;
