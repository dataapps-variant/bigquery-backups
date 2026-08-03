-- job_id: script_job_5e7ba0519335c5156839dc76f0094152_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:15:08.841000+00:00
-- started: 2026-08-03T09:15:08.854000+00:00
-- ended: 2026-08-03T09:15:08.902000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
