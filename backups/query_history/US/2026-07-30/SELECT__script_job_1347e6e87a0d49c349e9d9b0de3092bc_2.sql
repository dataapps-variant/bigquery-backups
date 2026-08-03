-- job_id: script_job_1347e6e87a0d49c349e9d9b0de3092bc_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:09.812000+00:00
-- started: 2026-07-30T08:45:09.827000+00:00
-- ended: 2026-07-30T08:45:09.903000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
