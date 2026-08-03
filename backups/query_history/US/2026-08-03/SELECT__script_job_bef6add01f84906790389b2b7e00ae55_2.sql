-- job_id: script_job_bef6add01f84906790389b2b7e00ae55_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:03.919000+00:00
-- started: 2026-08-03T08:45:03.957000+00:00
-- ended: 2026-08-03T08:45:04.030000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
