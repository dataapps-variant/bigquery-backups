-- job_id: script_job_2cb944e30bd216a226c800f44255d396_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:30:09.102000+00:00
-- started: 2026-08-01T08:30:09.114000+00:00
-- ended: 2026-08-01T08:30:09.179000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
