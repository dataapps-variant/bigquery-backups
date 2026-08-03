-- job_id: script_job_421f4bc6e3f0d5a7f5150b0435b30c04_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:06.863000+00:00
-- started: 2026-07-31T08:45:06.873000+00:00
-- ended: 2026-07-31T08:45:06.939000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
