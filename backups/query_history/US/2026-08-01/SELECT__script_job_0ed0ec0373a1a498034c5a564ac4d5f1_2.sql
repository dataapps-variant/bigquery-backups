-- job_id: script_job_0ed0ec0373a1a498034c5a564ac4d5f1_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:15:10.122000+00:00
-- started: 2026-08-01T09:15:10.132000+00:00
-- ended: 2026-08-01T09:15:10.222000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
