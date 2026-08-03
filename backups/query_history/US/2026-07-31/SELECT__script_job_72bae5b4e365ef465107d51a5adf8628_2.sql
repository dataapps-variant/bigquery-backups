-- job_id: script_job_72bae5b4e365ef465107d51a5adf8628_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:04.980000+00:00
-- started: 2026-07-31T08:45:04.994000+00:00
-- ended: 2026-07-31T08:45:05.071000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
