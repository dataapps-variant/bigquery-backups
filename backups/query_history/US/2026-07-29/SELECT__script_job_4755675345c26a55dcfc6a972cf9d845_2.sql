-- job_id: script_job_4755675345c26a55dcfc6a972cf9d845_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:45:07.168000+00:00
-- started: 2026-07-29T08:45:07.176000+00:00
-- ended: 2026-07-29T08:45:07.222000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
