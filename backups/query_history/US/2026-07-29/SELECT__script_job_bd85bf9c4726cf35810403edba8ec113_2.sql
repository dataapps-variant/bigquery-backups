-- job_id: script_job_bd85bf9c4726cf35810403edba8ec113_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:06.544000+00:00
-- started: 2026-07-29T08:45:06.557000+00:00
-- ended: 2026-07-29T08:45:06.695000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
