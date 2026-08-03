-- job_id: script_job_7cf63dd0e0dd3ec33d97cceeecc5531c_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T18:45:07.705000+00:00
-- started: 2026-07-28T18:45:07.722000+00:00
-- ended: 2026-07-28T18:45:07.834000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
