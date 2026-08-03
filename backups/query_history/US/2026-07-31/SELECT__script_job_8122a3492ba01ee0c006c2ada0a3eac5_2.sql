-- job_id: script_job_8122a3492ba01ee0c006c2ada0a3eac5_2
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:01:09.998000+00:00
-- started: 2026-07-31T12:01:10.009000+00:00
-- ended: 2026-07-31T12:01:10.115000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
