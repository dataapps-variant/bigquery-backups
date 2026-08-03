-- job_id: script_job_5d17c682b87ced9b4429cc60655f31a1_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:45:04.767000+00:00
-- started: 2026-07-28T08:45:04.780000+00:00
-- ended: 2026-07-28T08:45:04.852000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
