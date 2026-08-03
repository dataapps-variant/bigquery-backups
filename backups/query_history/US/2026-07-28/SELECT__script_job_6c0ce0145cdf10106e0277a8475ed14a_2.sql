-- job_id: script_job_6c0ce0145cdf10106e0277a8475ed14a_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:30:04.339000+00:00
-- started: 2026-07-28T09:30:04.349000+00:00
-- ended: 2026-07-28T09:30:04.411000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
