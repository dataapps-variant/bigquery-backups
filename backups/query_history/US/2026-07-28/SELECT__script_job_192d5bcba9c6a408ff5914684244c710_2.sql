-- job_id: script_job_192d5bcba9c6a408ff5914684244c710_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:13:12.116000+00:00
-- started: 2026-07-28T18:13:12.132000+00:00
-- ended: 2026-07-28T18:13:12.212000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
