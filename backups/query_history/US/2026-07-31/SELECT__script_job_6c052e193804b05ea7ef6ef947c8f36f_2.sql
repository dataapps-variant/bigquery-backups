-- job_id: script_job_6c052e193804b05ea7ef6ef947c8f36f_2
-- user: workflows-bq-runner@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T11:31:43.896000+00:00
-- started: 2026-07-31T11:31:43.911000+00:00
-- ended: 2026-07-31T11:31:44.068000+00:00

SELECT 
    last_processed_date AS Last_Processed,
    new_start_date AS Processing_From,
    new_end_date AS Processing_To,
    days_to_process AS Days_To_Process,
    'Processing...' AS Status
