-- job_id: script_job_ac558d99710eed41636bf2463e66ca7f_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:05.362000+00:00
-- started: 2026-07-31T08:45:05.370000+00:00
-- ended: 2026-07-31T08:45:05.454000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
