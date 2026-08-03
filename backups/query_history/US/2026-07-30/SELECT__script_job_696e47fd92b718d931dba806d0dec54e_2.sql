-- job_id: script_job_696e47fd92b718d931dba806d0dec54e_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:30:06.816000+00:00
-- started: 2026-07-30T08:30:06.838000+00:00
-- ended: 2026-07-30T08:30:06.985000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
