-- job_id: script_job_321f77605b4f604bc1af12b9fe6d7625_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:04.707000+00:00
-- started: 2026-07-28T08:45:04.718000+00:00
-- ended: 2026-07-28T08:45:04.780000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
