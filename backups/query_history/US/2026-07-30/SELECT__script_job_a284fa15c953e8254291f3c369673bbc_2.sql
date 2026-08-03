-- job_id: script_job_a284fa15c953e8254291f3c369673bbc_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:08.715000+00:00
-- started: 2026-07-30T08:45:08.725000+00:00
-- ended: 2026-07-30T08:45:08.795000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
