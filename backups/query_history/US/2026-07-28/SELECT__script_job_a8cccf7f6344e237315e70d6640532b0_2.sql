-- job_id: script_job_a8cccf7f6344e237315e70d6640532b0_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:15:07.731000+00:00
-- started: 2026-07-28T18:15:07.743000+00:00
-- ended: 2026-07-28T18:15:07.826000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
