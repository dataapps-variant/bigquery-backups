-- job_id: script_job_cac68af22adaac4cd79b8ee5562f7d2f_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:15:08.250000+00:00
-- started: 2026-08-03T09:15:08.262000+00:00
-- ended: 2026-08-03T09:15:08.330000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
