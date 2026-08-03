-- job_id: script_job_a72bcd040b34a15b045f9889866c612c_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:11:13.620000+00:00
-- started: 2026-07-30T10:11:13.639000+00:00
-- ended: 2026-07-30T10:11:13.695000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
