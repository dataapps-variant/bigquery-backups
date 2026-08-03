-- job_id: script_job_0d3686601faa771655a0f3ced2e6492e_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T17:33:48.690000+00:00
-- started: 2026-07-28T17:33:48.698000+00:00
-- ended: 2026-07-28T17:33:48.866000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
