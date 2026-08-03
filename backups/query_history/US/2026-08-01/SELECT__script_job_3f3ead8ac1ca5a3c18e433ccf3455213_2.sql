-- job_id: script_job_3f3ead8ac1ca5a3c18e433ccf3455213_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:05.224000+00:00
-- started: 2026-08-01T08:45:05.238000+00:00
-- ended: 2026-08-01T08:45:05.303000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
