-- job_id: script_job_7759e7cddfbd261d4ed079a518338a5e_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T09:45:07.948000+00:00
-- started: 2026-07-31T09:45:07.962000+00:00
-- ended: 2026-07-31T09:45:08.035000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
