-- job_id: script_job_391019b3bfb3a02b6c8e091eb1b4a059_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:30:09.999000+00:00
-- started: 2026-07-30T08:30:10.040000+00:00
-- ended: 2026-07-30T08:30:10.140000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
