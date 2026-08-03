-- job_id: script_job_ffc73863ce9308623e2d3c5e09f3f4b6_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:09.276000+00:00
-- started: 2026-08-01T08:45:09.286000+00:00
-- ended: 2026-08-01T08:45:09.366000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
