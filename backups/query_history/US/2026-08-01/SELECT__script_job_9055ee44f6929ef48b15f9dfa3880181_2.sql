-- job_id: script_job_9055ee44f6929ef48b15f9dfa3880181_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:45:11.682000+00:00
-- started: 2026-08-01T09:45:11.692000+00:00
-- ended: 2026-08-01T09:45:11.740000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
