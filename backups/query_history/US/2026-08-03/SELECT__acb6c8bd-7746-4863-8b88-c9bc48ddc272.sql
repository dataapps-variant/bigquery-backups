-- job_id: acb6c8bd-7746-4863-8b88-c9bc48ddc272
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:28.008000+00:00
-- started: 2026-08-03T12:23:28.070000+00:00
-- ended: 2026-08-03T12:23:29.995000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-12' AND activity_date <= DATE('2026-08-02')
