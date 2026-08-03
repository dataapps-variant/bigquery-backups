-- job_id: script_job_7c4f94050df6bf7b1f8f943752848977_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:30:04.696000+00:00
-- started: 2026-08-03T08:30:04.715000+00:00
-- ended: 2026-08-03T08:30:04.886000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
