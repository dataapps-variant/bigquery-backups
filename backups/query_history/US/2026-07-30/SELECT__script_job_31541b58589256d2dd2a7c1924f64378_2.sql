-- job_id: script_job_31541b58589256d2dd2a7c1924f64378_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:07.926000+00:00
-- started: 2026-07-30T08:45:07.940000+00:00
-- ended: 2026-07-30T08:45:08.008000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
