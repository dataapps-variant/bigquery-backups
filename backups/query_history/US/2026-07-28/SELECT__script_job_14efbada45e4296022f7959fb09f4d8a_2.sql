-- job_id: script_job_14efbada45e4296022f7959fb09f4d8a_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:30:06.443000+00:00
-- started: 2026-07-28T08:30:06.460000+00:00
-- ended: 2026-07-28T08:30:06.572000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
