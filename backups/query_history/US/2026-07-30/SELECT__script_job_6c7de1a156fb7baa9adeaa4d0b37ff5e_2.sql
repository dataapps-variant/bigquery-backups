-- job_id: script_job_6c7de1a156fb7baa9adeaa4d0b37ff5e_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:58:25.226000+00:00
-- started: 2026-07-30T10:58:25.237000+00:00
-- ended: 2026-07-30T10:58:25.287000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
