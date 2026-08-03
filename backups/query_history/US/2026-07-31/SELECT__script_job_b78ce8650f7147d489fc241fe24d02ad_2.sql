-- job_id: script_job_b78ce8650f7147d489fc241fe24d02ad_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:15:06.469000+00:00
-- started: 2026-07-31T09:15:06.476000+00:00
-- ended: 2026-07-31T09:15:06.522000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
