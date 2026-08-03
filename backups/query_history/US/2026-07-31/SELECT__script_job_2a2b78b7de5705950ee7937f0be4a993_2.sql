-- job_id: script_job_2a2b78b7de5705950ee7937f0be4a993_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:06.180000+00:00
-- started: 2026-07-31T08:45:06.188000+00:00
-- ended: 2026-07-31T08:45:06.257000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
