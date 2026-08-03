-- job_id: script_job_420e8eeea327132b5736b015627b3e61_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T10:17:39.897000+00:00
-- started: 2026-07-29T10:17:39.907000+00:00
-- ended: 2026-07-29T10:17:39.985000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
