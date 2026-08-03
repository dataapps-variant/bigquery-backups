-- job_id: script_job_9fa489308042a16faa870790d454c7c5_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:04.471000+00:00
-- started: 2026-08-03T08:45:04.495000+00:00
-- ended: 2026-08-03T08:45:04.563000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
