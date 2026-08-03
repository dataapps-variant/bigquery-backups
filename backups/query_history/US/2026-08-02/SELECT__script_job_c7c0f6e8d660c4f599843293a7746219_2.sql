-- job_id: script_job_c7c0f6e8d660c4f599843293a7746219_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:06.453000+00:00
-- started: 2026-08-02T08:45:06.471000+00:00
-- ended: 2026-08-02T08:45:06.529000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
