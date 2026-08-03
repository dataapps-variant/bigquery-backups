-- job_id: script_job_001f4c1b9bb29c8630832d570921c284_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T17:17:08.529000+00:00
-- started: 2026-07-28T17:17:08.539000+00:00
-- ended: 2026-07-28T17:17:08.598000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
