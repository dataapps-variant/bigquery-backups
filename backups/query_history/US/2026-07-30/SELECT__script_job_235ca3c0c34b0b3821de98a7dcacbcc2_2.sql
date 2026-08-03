-- job_id: script_job_235ca3c0c34b0b3821de98a7dcacbcc2_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:07.235000+00:00
-- started: 2026-07-30T08:45:07.246000+00:00
-- ended: 2026-07-30T08:45:07.305000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
