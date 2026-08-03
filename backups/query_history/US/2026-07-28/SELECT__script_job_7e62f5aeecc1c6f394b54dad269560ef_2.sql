-- job_id: script_job_7e62f5aeecc1c6f394b54dad269560ef_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:07:55.123000+00:00
-- started: 2026-07-28T18:07:55.142000+00:00
-- ended: 2026-07-28T18:07:55.215000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
