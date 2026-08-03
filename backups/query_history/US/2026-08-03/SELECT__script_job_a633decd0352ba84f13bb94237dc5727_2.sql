-- job_id: script_job_a633decd0352ba84f13bb94237dc5727_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:04.574000+00:00
-- started: 2026-08-03T08:45:04.584000+00:00
-- ended: 2026-08-03T08:45:04.637000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
