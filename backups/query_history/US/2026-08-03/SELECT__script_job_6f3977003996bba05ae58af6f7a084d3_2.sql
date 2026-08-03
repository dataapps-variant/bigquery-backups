-- job_id: script_job_6f3977003996bba05ae58af6f7a084d3_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:15:06.506000+00:00
-- started: 2026-08-03T09:15:06.544000+00:00
-- ended: 2026-08-03T09:15:06.658000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
