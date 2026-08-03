-- job_id: script_job_7db8ad86362cd3594083ffc56aa9b005_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:15:07.284000+00:00
-- started: 2026-08-03T09:15:07.302000+00:00
-- ended: 2026-08-03T09:15:07.390000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
