-- job_id: script_job_b07e95a87abaabedf23317b1b4a7736c_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:04.526000+00:00
-- started: 2026-08-03T08:45:04.537000+00:00
-- ended: 2026-08-03T08:45:04.589000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
