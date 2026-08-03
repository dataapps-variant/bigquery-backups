-- job_id: script_job_334186a500ba4d67702d0f685aa90e0a_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:06.737000+00:00
-- started: 2026-07-28T08:45:06.749000+00:00
-- ended: 2026-07-28T08:45:06.821000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
