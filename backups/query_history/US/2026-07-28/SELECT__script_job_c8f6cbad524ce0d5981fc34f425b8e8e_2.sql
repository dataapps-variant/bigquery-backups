-- job_id: script_job_c8f6cbad524ce0d5981fc34f425b8e8e_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:30:05.287000+00:00
-- started: 2026-07-28T08:30:05.303000+00:00
-- ended: 2026-07-28T08:30:06.170000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
