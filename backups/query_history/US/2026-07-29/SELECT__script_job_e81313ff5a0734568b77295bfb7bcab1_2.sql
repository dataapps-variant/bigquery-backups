-- job_id: script_job_e81313ff5a0734568b77295bfb7bcab1_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:07.256000+00:00
-- started: 2026-07-29T08:45:07.268000+00:00
-- ended: 2026-07-29T08:45:07.335000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
