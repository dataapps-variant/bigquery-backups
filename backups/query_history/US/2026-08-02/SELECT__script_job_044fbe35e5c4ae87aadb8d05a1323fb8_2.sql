-- job_id: script_job_044fbe35e5c4ae87aadb8d05a1323fb8_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:13.515000+00:00
-- started: 2026-08-02T08:45:13.529000+00:00
-- ended: 2026-08-02T08:45:13.596000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
