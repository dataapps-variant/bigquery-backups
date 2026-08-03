-- job_id: script_job_7561938721bf4c41e5bc90776f2102ed_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:45:06.624000+00:00
-- started: 2026-07-28T09:45:06.638000+00:00
-- ended: 2026-07-28T09:45:06.701000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
