-- job_id: script_job_d01aeb478cfcf7938c22872d38d31297_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:34:19.727000+00:00
-- started: 2026-07-28T18:34:19.741000+00:00
-- ended: 2026-07-28T18:34:19.807000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
