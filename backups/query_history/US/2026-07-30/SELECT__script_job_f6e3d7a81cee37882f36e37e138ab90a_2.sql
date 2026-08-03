-- job_id: script_job_f6e3d7a81cee37882f36e37e138ab90a_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:19:11.117000+00:00
-- started: 2026-07-30T10:19:11.130000+00:00
-- ended: 2026-07-30T10:19:11.226000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
