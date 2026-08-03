-- job_id: script_job_334587a6422fd9c98c3739402e0ae205_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-29T08:30:09.003000+00:00
-- started: 2026-07-29T08:30:09.053000+00:00
-- ended: 2026-07-29T08:30:09.208000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
