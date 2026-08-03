-- job_id: script_job_5571b8790554db937d860d9e94f65edd_2
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-08-03T08:45:04.255000+00:00
-- started: 2026-08-03T08:45:04.263000+00:00
-- ended: 2026-08-03T08:45:04.304000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
