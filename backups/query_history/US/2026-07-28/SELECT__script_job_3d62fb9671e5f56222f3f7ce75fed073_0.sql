-- job_id: script_job_3d62fb9671e5f56222f3f7ce75fed073_0
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:39:30.294000+00:00
-- started: 2026-07-28T14:39:30.305000+00:00
-- ended: 2026-07-28T14:39:30.466000+00:00

SELECT STRUCT<ARRAY<DATE>>(GENERATE_DATE_ARRAY(month_start, DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 1 MONTH)).*;
