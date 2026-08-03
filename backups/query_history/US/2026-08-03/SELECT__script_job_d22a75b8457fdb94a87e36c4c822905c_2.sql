-- job_id: script_job_d22a75b8457fdb94a87e36c4c822905c_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:05.948000+00:00
-- started: 2026-08-03T08:45:05.968000+00:00
-- ended: 2026-08-03T08:45:06.038000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
