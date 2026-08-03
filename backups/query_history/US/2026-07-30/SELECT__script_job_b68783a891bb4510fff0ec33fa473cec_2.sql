-- job_id: script_job_b68783a891bb4510fff0ec33fa473cec_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:57:25.508000+00:00
-- started: 2026-07-30T10:57:25.522000+00:00
-- ended: 2026-07-30T10:57:25.606000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
