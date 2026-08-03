-- job_id: script_job_a030e3a10975766976ec364a7ef570cb_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:06.841000+00:00
-- started: 2026-07-31T08:45:06.853000+00:00
-- ended: 2026-07-31T08:45:06.913000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
