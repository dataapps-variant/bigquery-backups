-- job_id: script_job_f119afce262f6be7d22fe990e768c494_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:26:40.812000+00:00
-- started: 2026-07-28T18:26:40.821000+00:00
-- ended: 2026-07-28T18:26:40.906000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
