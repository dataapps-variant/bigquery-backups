-- job_id: script_job_47d99a0450ca83787319f366c5b51399_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T08:30:07.967000+00:00
-- started: 2026-07-28T08:30:07.978000+00:00
-- ended: 2026-07-28T08:30:08.052000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
