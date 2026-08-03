-- job_id: script_job_783295563ad478ef7907a479fd153d42_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:22:46.990000+00:00
-- started: 2026-07-30T10:22:47.003000+00:00
-- ended: 2026-07-30T10:22:47.060000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
