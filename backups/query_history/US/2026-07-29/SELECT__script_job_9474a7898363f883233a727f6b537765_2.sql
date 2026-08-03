-- job_id: script_job_9474a7898363f883233a727f6b537765_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:45:05.986000+00:00
-- started: 2026-07-29T09:45:06.002000+00:00
-- ended: 2026-07-29T09:45:06.067000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
