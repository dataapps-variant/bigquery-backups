-- job_id: script_job_09e82dc2828bf3ba81d7836b56fbd78f_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:30:06.133000+00:00
-- started: 2026-07-29T09:30:06.151000+00:00
-- ended: 2026-07-29T09:30:06.216000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
