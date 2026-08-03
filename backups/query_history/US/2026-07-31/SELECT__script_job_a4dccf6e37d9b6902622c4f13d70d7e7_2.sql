-- job_id: script_job_a4dccf6e37d9b6902622c4f13d70d7e7_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:05.442000+00:00
-- started: 2026-07-31T08:45:05.461000+00:00
-- ended: 2026-07-31T08:45:05.843000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
