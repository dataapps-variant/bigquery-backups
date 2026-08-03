-- job_id: script_job_cda1774f0ad64c16cb471e20878d5290_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:03.718000+00:00
-- started: 2026-08-03T08:45:03.728000+00:00
-- ended: 2026-08-03T08:45:03.778000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
