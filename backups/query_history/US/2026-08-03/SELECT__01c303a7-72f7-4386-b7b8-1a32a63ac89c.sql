-- job_id: 01c303a7-72f7-4386-b7b8-1a32a63ac89c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:00.841000+00:00
-- started: 2026-08-03T12:27:00.903000+00:00
-- ended: 2026-08-03T12:27:02.686000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-46' AND activity_date <= DATE('2026-08-02')
