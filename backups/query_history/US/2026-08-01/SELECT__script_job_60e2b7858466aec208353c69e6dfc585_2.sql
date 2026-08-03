-- job_id: script_job_60e2b7858466aec208353c69e6dfc585_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:05.198000+00:00
-- started: 2026-08-01T08:45:05.224000+00:00
-- ended: 2026-08-01T08:45:05.274000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
