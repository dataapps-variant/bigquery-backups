-- job_id: script_job_0a7b1c356cbe7088758192ee261eb9f9_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T09:50:35.482000+00:00
-- started: 2026-07-29T09:50:35.508000+00:00
-- ended: 2026-07-29T09:50:35.638000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
