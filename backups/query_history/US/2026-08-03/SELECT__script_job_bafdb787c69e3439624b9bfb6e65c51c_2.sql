-- job_id: script_job_bafdb787c69e3439624b9bfb6e65c51c_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:30:05.685000+00:00
-- started: 2026-08-03T09:30:05.698000+00:00
-- ended: 2026-08-03T09:30:05.758000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
