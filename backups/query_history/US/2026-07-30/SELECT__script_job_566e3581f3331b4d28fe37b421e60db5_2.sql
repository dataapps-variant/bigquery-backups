-- job_id: script_job_566e3581f3331b4d28fe37b421e60db5_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:30:11.017000+00:00
-- started: 2026-07-30T09:30:11.034000+00:00
-- ended: 2026-07-30T09:30:11.111000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
