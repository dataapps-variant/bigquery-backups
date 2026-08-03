-- job_id: script_job_ae29f76f472e1444d1de233ef1dd2b78_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:45:06.136000+00:00
-- started: 2026-08-03T09:45:06.142000+00:00
-- ended: 2026-08-03T09:45:06.199000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
