-- job_id: script_job_9ea1bf671c4ad085cea066cbd4176609_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:06.263000+00:00
-- started: 2026-08-01T08:45:06.273000+00:00
-- ended: 2026-08-01T08:45:06.331000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
