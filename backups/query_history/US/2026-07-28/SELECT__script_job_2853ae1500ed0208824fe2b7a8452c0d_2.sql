-- job_id: script_job_2853ae1500ed0208824fe2b7a8452c0d_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:04.242000+00:00
-- started: 2026-07-28T08:45:04.255000+00:00
-- ended: 2026-07-28T08:45:04.304000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
