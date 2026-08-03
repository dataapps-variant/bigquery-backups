-- job_id: script_job_95ae45eed3066e0f01f7fb9e82a0297b_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T10:00:06.874000+00:00
-- started: 2026-07-31T10:00:06.935000+00:00
-- ended: 2026-07-31T10:00:07.029000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
