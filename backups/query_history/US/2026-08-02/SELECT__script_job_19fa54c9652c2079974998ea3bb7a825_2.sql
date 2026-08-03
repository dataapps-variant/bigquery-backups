-- job_id: script_job_19fa54c9652c2079974998ea3bb7a825_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T08:45:04.140000+00:00
-- started: 2026-08-02T08:45:04.147000+00:00
-- ended: 2026-08-02T08:45:04.212000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
