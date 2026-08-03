-- job_id: script_job_45a563c14160a613d53c19766b7c74ae_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:30:05.343000+00:00
-- started: 2026-08-01T08:30:05.357000+00:00
-- ended: 2026-08-01T08:30:05.467000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
