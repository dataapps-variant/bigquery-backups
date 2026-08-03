-- job_id: script_job_9363f7fab6c063e866c81f737aecb79a_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:06.755000+00:00
-- started: 2026-08-03T08:45:06.771000+00:00
-- ended: 2026-08-03T08:45:06.846000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
