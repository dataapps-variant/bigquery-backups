-- job_id: script_job_65cca8e1cd765f44618c9c1eeb6af5ea_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:30:04.234000+00:00
-- started: 2026-08-03T08:30:04.251000+00:00
-- ended: 2026-08-03T08:30:04.323000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
