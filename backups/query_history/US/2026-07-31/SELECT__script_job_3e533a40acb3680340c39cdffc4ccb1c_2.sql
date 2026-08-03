-- job_id: script_job_3e533a40acb3680340c39cdffc4ccb1c_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:30:08.151000+00:00
-- started: 2026-07-31T09:30:08.165000+00:00
-- ended: 2026-07-31T09:30:08.251000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
