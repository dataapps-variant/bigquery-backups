-- job_id: script_job_c0c9098138e3b89b4164f2613b5cca64_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:08.631000+00:00
-- started: 2026-07-29T08:45:08.641000+00:00
-- ended: 2026-07-29T08:45:08.702000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
