-- job_id: script_job_9d58ddae757181f7ec6b177c3ef5b6ec_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:34:29.870000+00:00
-- started: 2026-07-29T09:34:29.887000+00:00
-- ended: 2026-07-29T09:34:29.975000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
