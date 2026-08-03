-- job_id: script_job_5724e033386cb9d5b128b3b8fb70604e_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:08.363000+00:00
-- started: 2026-08-03T08:45:08.375000+00:00
-- ended: 2026-08-03T08:45:08.445000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
