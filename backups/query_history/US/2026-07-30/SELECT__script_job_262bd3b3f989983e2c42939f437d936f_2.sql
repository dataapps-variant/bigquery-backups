-- job_id: script_job_262bd3b3f989983e2c42939f437d936f_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:06.963000+00:00
-- started: 2026-07-30T08:45:06.978000+00:00
-- ended: 2026-07-30T08:45:07.178000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
