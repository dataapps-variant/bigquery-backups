-- job_id: script_job_8728b4c44a0805d6acbbf2e3f1ee5fe3_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:30:06.155000+00:00
-- started: 2026-07-28T08:30:06.186000+00:00
-- ended: 2026-07-28T08:30:06.258000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
