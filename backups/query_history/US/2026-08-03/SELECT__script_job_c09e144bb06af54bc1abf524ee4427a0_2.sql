-- job_id: script_job_c09e144bb06af54bc1abf524ee4427a0_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T10:00:10.198000+00:00
-- started: 2026-08-03T10:00:10.250000+00:00
-- ended: 2026-08-03T10:00:10.315000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
