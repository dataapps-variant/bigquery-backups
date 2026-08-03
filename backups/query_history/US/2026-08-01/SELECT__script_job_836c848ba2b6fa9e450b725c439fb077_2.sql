-- job_id: script_job_836c848ba2b6fa9e450b725c439fb077_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T09:15:05.677000+00:00
-- started: 2026-08-01T09:15:05.694000+00:00
-- ended: 2026-08-01T09:15:05.771000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
