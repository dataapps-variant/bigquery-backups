-- job_id: script_job_07475dfa7dcd8104e5f2afce0418e09e_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:45:08.542000+00:00
-- started: 2026-07-29T09:45:08.557000+00:00
-- ended: 2026-07-29T09:45:08.631000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
