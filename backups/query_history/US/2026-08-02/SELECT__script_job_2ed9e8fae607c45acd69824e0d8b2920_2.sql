-- job_id: script_job_2ed9e8fae607c45acd69824e0d8b2920_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:45:05.641000+00:00
-- started: 2026-08-02T09:45:05.647000+00:00
-- ended: 2026-08-02T09:45:05.686000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
