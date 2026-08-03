-- job_id: script_job_2668c5bb6f2293fc6e277f458f0c0e2c_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:59:39.431000+00:00
-- started: 2026-07-30T10:59:39.444000+00:00
-- ended: 2026-07-30T10:59:39.501000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
