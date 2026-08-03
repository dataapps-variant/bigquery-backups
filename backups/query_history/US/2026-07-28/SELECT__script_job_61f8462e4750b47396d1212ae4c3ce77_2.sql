-- job_id: script_job_61f8462e4750b47396d1212ae4c3ce77_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:30:12.753000+00:00
-- started: 2026-07-28T08:30:12.765000+00:00
-- ended: 2026-07-28T08:30:12.819000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
