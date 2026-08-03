-- job_id: script_job_6b04810965c01b5fe2f9cac41525a818_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:30:06.002000+00:00
-- started: 2026-07-30T08:30:06.019000+00:00
-- ended: 2026-07-30T08:30:06.169000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
