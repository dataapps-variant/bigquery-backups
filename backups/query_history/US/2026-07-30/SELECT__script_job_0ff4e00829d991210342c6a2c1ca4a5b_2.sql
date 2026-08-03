-- job_id: script_job_0ff4e00829d991210342c6a2c1ca4a5b_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T08:45:10.572000+00:00
-- started: 2026-07-30T08:45:10.584000+00:00
-- ended: 2026-07-30T08:45:10.631000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
