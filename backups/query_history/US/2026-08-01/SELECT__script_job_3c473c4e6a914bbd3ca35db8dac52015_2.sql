-- job_id: script_job_3c473c4e6a914bbd3ca35db8dac52015_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:05.281000+00:00
-- started: 2026-08-01T08:45:05.293000+00:00
-- ended: 2026-08-01T08:45:05.362000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
