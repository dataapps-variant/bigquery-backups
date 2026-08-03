-- job_id: job_YwurgS7lQczTwaGNwa5t9wr8HUEp
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-27T13:15:55.071000+00:00
-- started: 2026-07-27T13:15:55.162000+00:00
-- ended: 2026-07-27T13:15:55.395000+00:00

SELECT snapshot_id, snapshot_date, status, captured_at,
       TIMESTAMP_DIFF(current_timestamp, captured_at, MINUTE) AS age_minutes,
       row_count, total_spend
FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Google_spend_snapshot_registry`
ORDER BY captured_at DESC
LIMIT 10;
