-- job_id: script_job_1363aaca29b2fbd3285c86cd52da8099_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:45:04.470000+00:00
-- started: 2026-08-03T09:45:04.517000+00:00
-- ended: 2026-08-03T09:45:04.631000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
