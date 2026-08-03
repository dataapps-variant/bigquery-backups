-- job_id: script_job_ba62970694464b6f4b66289b05fec9d2_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:45:07.894000+00:00
-- started: 2026-07-31T09:45:07.911000+00:00
-- ended: 2026-07-31T09:45:08.002000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
