-- job_id: script_job_9f4654707115f7ebd0f6ee44ac91c38f_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:06.197000+00:00
-- started: 2026-08-01T08:45:06.203000+00:00
-- ended: 2026-08-01T08:45:06.363000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
