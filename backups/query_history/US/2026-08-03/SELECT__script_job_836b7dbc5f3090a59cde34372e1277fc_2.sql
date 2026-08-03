-- job_id: script_job_836b7dbc5f3090a59cde34372e1277fc_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:03.839000+00:00
-- started: 2026-08-03T08:45:03.847000+00:00
-- ended: 2026-08-03T08:45:03.886000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
