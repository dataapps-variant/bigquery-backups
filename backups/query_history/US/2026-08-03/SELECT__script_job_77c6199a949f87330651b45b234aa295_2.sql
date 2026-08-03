-- job_id: script_job_77c6199a949f87330651b45b234aa295_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:45:06.561000+00:00
-- started: 2026-08-03T09:45:06.638000+00:00
-- ended: 2026-08-03T09:45:06.703000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
