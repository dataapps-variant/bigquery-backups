-- job_id: script_job_6e9e821d812a9586cb417578cd2a9042_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T10:00:05.249000+00:00
-- started: 2026-08-01T10:00:05.263000+00:00
-- ended: 2026-08-01T10:00:05.333000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
