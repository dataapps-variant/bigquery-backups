-- job_id: script_job_d8ef5e7173f99dd5cc1b7392bfe87d4a_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:04.271000+00:00
-- started: 2026-07-28T08:45:04.284000+00:00
-- ended: 2026-07-28T08:45:04.335000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
