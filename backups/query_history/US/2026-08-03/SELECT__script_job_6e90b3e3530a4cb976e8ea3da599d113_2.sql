-- job_id: script_job_6e90b3e3530a4cb976e8ea3da599d113_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:03.569000+00:00
-- started: 2026-08-03T08:45:03.590000+00:00
-- ended: 2026-08-03T08:45:03.652000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
