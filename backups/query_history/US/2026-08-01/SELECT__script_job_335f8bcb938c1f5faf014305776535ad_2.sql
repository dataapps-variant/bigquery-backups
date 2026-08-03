-- job_id: script_job_335f8bcb938c1f5faf014305776535ad_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:04.306000+00:00
-- started: 2026-08-01T08:45:04.413000+00:00
-- ended: 2026-08-01T08:45:04.476000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
