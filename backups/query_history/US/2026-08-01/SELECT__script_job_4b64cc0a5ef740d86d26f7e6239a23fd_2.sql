-- job_id: script_job_4b64cc0a5ef740d86d26f7e6239a23fd_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:04.350000+00:00
-- started: 2026-08-01T08:45:04.364000+00:00
-- ended: 2026-08-01T08:45:04.422000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
