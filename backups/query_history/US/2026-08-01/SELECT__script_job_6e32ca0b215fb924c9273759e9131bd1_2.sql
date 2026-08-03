-- job_id: script_job_6e32ca0b215fb924c9273759e9131bd1_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-01T08:45:07.222000+00:00
-- started: 2026-08-01T08:45:07.243000+00:00
-- ended: 2026-08-01T08:45:07.311000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
