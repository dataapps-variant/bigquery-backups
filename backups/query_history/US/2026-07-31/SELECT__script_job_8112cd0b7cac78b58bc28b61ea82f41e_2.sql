-- job_id: script_job_8112cd0b7cac78b58bc28b61ea82f41e_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:45:07.917000+00:00
-- started: 2026-07-31T09:45:07.930000+00:00
-- ended: 2026-07-31T09:45:08.008000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
