-- job_id: script_job_daf6799ab9cf461084c8a51ba260dcdb_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T10:31:26.561000+00:00
-- started: 2026-07-29T10:31:26.579000+00:00
-- ended: 2026-07-29T10:31:26.645000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
