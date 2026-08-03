-- job_id: script_job_40ce8d5fb707703145ece536bebb13c9_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:13:35.121000+00:00
-- started: 2026-07-30T10:13:35.146000+00:00
-- ended: 2026-07-30T10:13:35.238000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
