-- job_id: script_job_ee3ed74a50c37f1777c76f52744e1e60_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:08.289000+00:00
-- started: 2026-08-01T08:45:08.303000+00:00
-- ended: 2026-08-01T08:45:08.378000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
