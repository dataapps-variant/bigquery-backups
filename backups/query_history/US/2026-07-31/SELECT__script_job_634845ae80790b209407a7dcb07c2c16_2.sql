-- job_id: script_job_634845ae80790b209407a7dcb07c2c16_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T08:45:06.281000+00:00
-- started: 2026-07-31T08:45:06.293000+00:00
-- ended: 2026-07-31T08:45:06.360000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
