-- job_id: 8bf9db31-2591-42ae-8fb0-7c387a88f9f3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:11.284000+00:00
-- started: 2026-08-03T12:26:11.337000+00:00
-- ended: 2026-08-03T12:26:13.342000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-39' AND activity_date <= DATE('2026-08-02')
