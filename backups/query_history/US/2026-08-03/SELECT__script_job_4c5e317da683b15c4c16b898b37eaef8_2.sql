-- job_id: script_job_4c5e317da683b15c4c16b898b37eaef8_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T09:30:09.287000+00:00
-- started: 2026-08-03T09:30:09.311000+00:00
-- ended: 2026-08-03T09:30:09.398000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
