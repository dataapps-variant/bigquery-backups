-- job_id: script_job_dd4c4871dfa6b5026ffd9ad1ca0548f6_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-02T09:15:05.741000+00:00
-- started: 2026-08-02T09:15:05.767000+00:00
-- ended: 2026-08-02T09:15:05.830000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
