-- job_id: script_job_a8220abafab91f607267116e7bdead06_0
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T08:43:52.779000+00:00
-- started: 2026-07-29T08:43:52.849000+00:00
-- ended: 2026-07-29T08:43:53.014000+00:00

SELECT STRUCT<ARRAY<DATE>>(GENERATE_DATE_ARRAY(month_start, DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 1 MONTH)).*;
