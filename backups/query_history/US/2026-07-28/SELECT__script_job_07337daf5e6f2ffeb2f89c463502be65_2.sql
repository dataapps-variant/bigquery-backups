-- job_id: script_job_07337daf5e6f2ffeb2f89c463502be65_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:37:16.856000+00:00
-- started: 2026-07-28T18:37:16.873000+00:00
-- ended: 2026-07-28T18:37:17.197000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
