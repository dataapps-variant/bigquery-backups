-- job_id: script_job_cb7a603349462b474f20189a8c3fb0e5_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:04.185000+00:00
-- started: 2026-08-02T08:45:04.207000+00:00
-- ended: 2026-08-02T08:45:04.281000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
