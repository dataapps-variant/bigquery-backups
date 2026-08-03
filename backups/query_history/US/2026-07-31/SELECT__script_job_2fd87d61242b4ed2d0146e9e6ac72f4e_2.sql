-- job_id: script_job_2fd87d61242b4ed2d0146e9e6ac72f4e_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:15:05.263000+00:00
-- started: 2026-07-31T09:15:05.272000+00:00
-- ended: 2026-07-31T09:15:05.402000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
