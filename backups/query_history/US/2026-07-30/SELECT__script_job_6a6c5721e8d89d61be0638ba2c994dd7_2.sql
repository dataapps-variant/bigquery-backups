-- job_id: script_job_6a6c5721e8d89d61be0638ba2c994dd7_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T10:55:56.491000+00:00
-- started: 2026-07-30T10:55:56.506000+00:00
-- ended: 2026-07-30T10:55:56.571000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
