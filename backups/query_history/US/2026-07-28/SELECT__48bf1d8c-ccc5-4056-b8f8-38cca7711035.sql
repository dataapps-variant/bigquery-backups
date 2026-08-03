-- job_id: 48bf1d8c-ccc5-4056-b8f8-38cca7711035
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:46.626000+00:00
-- started: 2026-07-28T14:31:46.742000+00:00
-- ended: 2026-07-28T14:31:48.556000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-20' AND activity_date <= DATE('2026-07-27')
