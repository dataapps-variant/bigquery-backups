-- job_id: script_job_49b7e46ea4c241564fc51eabe8b3fd8b_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:30:04.212000+00:00
-- started: 2026-08-03T08:30:04.222000+00:00
-- ended: 2026-08-03T08:30:04.318000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
