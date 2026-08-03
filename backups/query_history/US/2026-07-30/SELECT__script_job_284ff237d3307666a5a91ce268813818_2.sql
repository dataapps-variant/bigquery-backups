-- job_id: script_job_284ff237d3307666a5a91ce268813818_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:45:07.472000+00:00
-- started: 2026-07-30T09:45:07.484000+00:00
-- ended: 2026-07-30T09:45:07.552000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
