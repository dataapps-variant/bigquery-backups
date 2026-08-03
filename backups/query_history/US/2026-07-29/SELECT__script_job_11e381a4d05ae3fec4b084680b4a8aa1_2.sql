-- job_id: script_job_11e381a4d05ae3fec4b084680b4a8aa1_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:07.790000+00:00
-- started: 2026-07-29T08:45:07.807000+00:00
-- ended: 2026-07-29T08:45:07.897000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
