-- job_id: script_job_cb0728ec30e0fb584b9973334562baf8_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:15:06.232000+00:00
-- started: 2026-07-31T09:15:06.244000+00:00
-- ended: 2026-07-31T09:15:06.302000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
