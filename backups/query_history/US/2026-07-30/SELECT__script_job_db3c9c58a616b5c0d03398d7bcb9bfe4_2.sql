-- job_id: script_job_db3c9c58a616b5c0d03398d7bcb9bfe4_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:30:09.671000+00:00
-- started: 2026-07-30T09:30:09.699000+00:00
-- ended: 2026-07-30T09:30:09.790000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
