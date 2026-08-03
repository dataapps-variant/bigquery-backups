-- job_id: script_job_a1318567a1f05cc38421e93bde39d668_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:50:30.121000+00:00
-- started: 2026-07-28T18:50:30.132000+00:00
-- ended: 2026-07-28T18:50:30.208000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
