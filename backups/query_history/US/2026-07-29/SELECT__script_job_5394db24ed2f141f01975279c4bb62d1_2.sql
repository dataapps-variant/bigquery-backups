-- job_id: script_job_5394db24ed2f141f01975279c4bb62d1_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:45:06.461000+00:00
-- started: 2026-07-29T09:45:06.472000+00:00
-- ended: 2026-07-29T09:45:06.532000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
