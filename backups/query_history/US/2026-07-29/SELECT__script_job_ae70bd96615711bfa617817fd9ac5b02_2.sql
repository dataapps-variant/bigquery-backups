-- job_id: script_job_ae70bd96615711bfa617817fd9ac5b02_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T10:12:31.495000+00:00
-- started: 2026-07-29T10:12:31.510000+00:00
-- ended: 2026-07-29T10:12:31.585000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
