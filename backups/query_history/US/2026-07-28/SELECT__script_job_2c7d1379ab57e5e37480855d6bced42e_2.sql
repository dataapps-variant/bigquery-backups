-- job_id: script_job_2c7d1379ab57e5e37480855d6bced42e_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T15:10:23+00:00
-- started: 2026-07-28T15:10:23.015000+00:00
-- ended: 2026-07-28T15:10:23.756000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
