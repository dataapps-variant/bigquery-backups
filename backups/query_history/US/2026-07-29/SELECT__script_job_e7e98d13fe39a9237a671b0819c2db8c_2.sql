-- job_id: script_job_e7e98d13fe39a9237a671b0819c2db8c_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T10:32:38.384000+00:00
-- started: 2026-07-29T10:32:38.397000+00:00
-- ended: 2026-07-29T10:32:38.470000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
