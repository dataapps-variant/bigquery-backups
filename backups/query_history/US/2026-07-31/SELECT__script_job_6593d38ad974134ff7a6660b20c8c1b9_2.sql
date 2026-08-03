-- job_id: script_job_6593d38ad974134ff7a6660b20c8c1b9_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:15:05.772000+00:00
-- started: 2026-07-31T09:15:05.785000+00:00
-- ended: 2026-07-31T09:15:05.859000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
